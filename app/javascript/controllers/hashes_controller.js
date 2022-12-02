import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["ul"]
  connect() {
    this.hashes = this.element.dataset.hashes
    this.isSignIn = this.element.dataset.signin
    if (this.hashes) {
      localStorage["hashes"] = this.hashes
    } else {
      localStorage["hashes"] &&
        this.createLinksFromHashes(localStorage["hashes"])
    }
    if (this.isSignIn) {
      this.createShortUrlField(localStorage["hashes"])
      localStorage.removeItem("hashes")
    } else {
      this.createShortUrlField(localStorage["hashes"])
    }
  }

  createShortUrlField(hashes) {
    const field = document.createElement("input")
    field.setAttribute("type", "hidden")
    field.setAttribute("name", "hashes")
    field.setAttribute("value", hashes)

    document.querySelector("#form-lite").appendChild(field)
  }

  createLinksFromHashes(hashes) {
    const str = JSON.parse(hashes)
      .map((link, idx, arr) => {
        return `<li class="text-gray-300 m-3">
      <div>
        ${arr.length - idx}
        ${link["long_url"]}
        Created by Anonymous
      </div>
      <div>
        <a href="${link["custom_url"]}"
          class="text-black text-xl hover:underline"
          target="_blank">${link["custom_url"]}</a>
        <a href="${link["long_url"]}"
        class="hover:underline hover:text-blue-600"
        target="_blank">${link["long_url"]}</a>
      </div>
    </li>`
      })
      .join("")
    this.ulTarget.insertAdjacentHTML("beforeend", str)
  }
}
