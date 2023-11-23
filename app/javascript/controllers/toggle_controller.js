import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["toggleableElement"]
  // target as data-toggle-target='toggleableElement'

  fire() {
    this.toggleableElementTarget.classList.toggle('d-none')
    console.log("fire")
  }
}
