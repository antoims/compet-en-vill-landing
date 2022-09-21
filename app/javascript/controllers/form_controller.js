import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label", "input"]

  submitForm() {
    this.element.submit();
  }

  focusOut() {
    if (this.inputTarget.value.length === 0) {
      this.labelTarget.classList.remove("active");
    }
  }

  focusIn() {
    this.labelTarget.classList.add("active");
  }

}
