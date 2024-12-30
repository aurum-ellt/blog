import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static classes = [ "hidden" ]
  static targets = [ "input", "icon" ]

  connect() {
    this.hidden = this.inputTarget.type === "password"
  }

  toggleVisibility(event) {
    event.preventDefault()

    this.hidden = !this.hidden
    this.inputTarget.type = this.hidden ? "password" : "text"
    this.iconTargets.forEach(icon => icon.classList.toggle(this.hiddenClass))
  }
}
