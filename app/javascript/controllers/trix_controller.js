import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { unusedComponents: Array }

  initialize() {
    this.setup = this.setup.bind(this)
  }

  connect() {
    document.addEventListener("trix-initialize", this.setup, true)
  }

  disconect() {
    document.removeEventListener("trix-initialize", this.setup)
  }

  setup() {
    this.unusedComponentsValue.forEach(component => {
      document.querySelector(component)?.remove()
    })
  }
}