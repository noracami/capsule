import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // <!-- Meta Pixel Code -->
    if (window.fbq) return
    !(function (f, b, e, v, n, t, s) {
      n = f.fbq = function () {
        n.callMethod
          ? n.callMethod.apply(n, arguments)
          : n.queue.push(arguments)
      }
      if (!f._fbq) f._fbq = n
      n.push = n
      n.loaded = !0
      n.version = "2.0"
      n.queue = []
      t = b.createElement(e)
      t.async = !0
      t.src = v
      s = b.getElementsByTagName(e)[0]
      s.parentNode.insertBefore(t, s)
    })(
      window,
      document,
      "script",
      "https://connect.facebook.net/en_US/fbevents.js"
    )
    fbq("init", "1193973524877886")
    fbq("track", "PageView")
    // <!-- End Meta Pixel Code -->
  }
}
