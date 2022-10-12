import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    let s = this.element.dataset.hashes;
    if (s) localStorage["hashes"] = s;
    console.log(localStorage["hashes"]);
  }
}
