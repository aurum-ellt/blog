import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "input", "item" ]

  check() {
    const disabled = this.inputTargets.some(input => {
      if (input.type === "checkbox") {
        return input.checked === false
      }

      return input.dataset.confirmationContent !== input.value
    })

    this.itemTargets.forEach(target => target.disabled = disabled)
  }
}
