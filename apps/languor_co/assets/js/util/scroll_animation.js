import sal from "sal.js"

export default function () {
  const scrollAnimatedElements = Array.from(document.querySelectorAll("[data-scroll-animation]"))
  const mobileThreshold = 0.10
  const desktopThreshold = 0.90
  const fallbackThreshold = 0.0001
  const isTabletOrLarger = () => window.innerWidth > 599
  const isLargerThanViewport = (element, threshold) => (element.getBoundingClientRect().height * threshold) > window.innerHeight
  const scrollAnimatedElementLargerThanViewportExists = (threshold) => scrollAnimatedElements.some(el => isLargerThanViewport(el, threshold))

  function getIntersectionObserverThreshold() {
    if (isTabletOrLarger()) {
      return scrollAnimatedElementLargerThanViewportExists(desktopThreshold) ? fallbackThreshold : desktopThreshold
    } else {
      return scrollAnimatedElementLargerThanViewportExists(mobileThreshold) ? fallbackThreshold : mobileThreshold
    }
  }

  function setIntersectionObserverThreshold() {
    scrollAnimationsObserver.reset({
      threshold: getIntersectionObserverThreshold()
    })
  }

  const scrollAnimationsObserver = sal({
    threshold: getIntersectionObserverThreshold(),
    selector: "[data-scroll-animation]",
    animateClassName: "show"
  })

  var resizeEvent
  const resizeCallback = () => {
    clearTimeout(resizeEvent)
    resizeEvent = setTimeout(setIntersectionObserverThreshold, 100)
  }

  window.addEventListener("resize", resizeCallback)
  screen.orientation.addEventListener("change", resizeCallback) // no safari support
  window.addEventListener("orientationchange", resizeCallback) // deprecated


  document.addEventListener("sal:in", ({
    detail
  }) => {
    detail.target.classList.add("seen")
  })
}
