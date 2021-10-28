// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.

//
// Import deps with the dep name or local files with a relative path, for example:
//
//     import {Socket} from "phoenix"
//     import socket from "./socket"
//

import "phoenix_html"
import { Socket } from "phoenix"
import topbar from "topbar"
import { LiveSocket } from "phoenix_live_view"

import Hooks from "./_hooks"
import domCallbacks from "./dom/callbacks"
import OverlayScrollbars from "overlayscrollbars"
import initializeScrollAnimations from "./util/scroll_animation"
import Alpine from "alpinejs"

document.addEventListener("DOMContentLoaded", function () {
  window.scrollInstance = OverlayScrollbars(document.querySelectorAll("body"), {
    scrollbars : {
      visibility : "auto",
      autoHide : "move",
    },
  })
  Alpine.start()
  window.Alpine = Alpine

  let urlContentAfterHash = window.location.hash.split("#")[1]
  let sectionElement = document.getElementById(urlContentAfterHash?.toLowerCase())
  if(sectionElement) {
    let currentNavHeight = document.getElementById("nav").offsetHeight
    window.scrollInstance.scroll({ el : sectionElement,  margin : currentNavHeight })
  }
})

initializeScrollAnimations()

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
  params: {
    _csrf_token: csrfToken
  },
  hooks: Hooks,
  dom: domCallbacks
})

// Show progress bar on live navigation and form submits
topbar.config({
  barColors: {
    0: "#29d"
  },
  shadowColor: "rgba(0, 0, 0, .3)"
})

function handleButtonNavigation(event) {
  let navLocation = event.target.value
  if(navLocation){
    window.location.hash = navLocation

    let navLocationElement = document.getElementById(navLocation.toLowerCase())
    let currentNavHeight = document.getElementById("nav").offsetHeight
    window.scrollInstance.scroll({ el : navLocationElement,  margin : currentNavHeight }, 1200)
  } else {
    window.location.hash ? history.pushState(null, null, " ") : null
    window.scrollInstance.scroll(0, 1200)
  }
}
document.querySelectorAll(".nav").forEach(elem => elem.addEventListener("click", handleButtonNavigation))

window.addEventListener("phx:page-loading-start", info => topbar.show()) // eslint-disable-line no-unused-vars
window.addEventListener("phx:page-loading-stop", info => topbar.hide()) // eslint-disable-line no-unused-vars

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket
