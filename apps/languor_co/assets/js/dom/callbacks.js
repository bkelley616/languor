const callbacks = {
  onBeforeElUpdated(from, to) {
    const scrollAnimationNode = from.attributes.getNamedItem("data-scroll-animation")
    if (scrollAnimationNode != null) {
      to.setAttribute("class", from.attributes.getNamedItem("class")?.value ?? null)
    }
    if (from._x_dataStack) {
      window.Alpine.clone(from, to)
    }
  },
}

export default callbacks
