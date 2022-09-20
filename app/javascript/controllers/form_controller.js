import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label", "input"]
  connect() {
    console.log(this.labelTarget);
    console.log(this.inputTarget);
  }

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
