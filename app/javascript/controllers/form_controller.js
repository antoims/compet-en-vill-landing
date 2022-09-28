import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label", "input", "container", "popup", "counter", "notice", "body"]

  focusOut() {
    if (this.inputTarget.value.length === 0) {
      this.labelTarget.classList.remove("active");
    }
  }

  focusIn() {
    this.labelTarget.classList.add("active");
  }


  displayPopup(event) {
    event.stopPropagation()
    fetch("/registrants", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({
        registrant: {
          email: this.inputTarget.value
        }
      })
    })
    .then(response => response.json())
    .then((data) => {
      if (data.status) {
        this.bodyTarget.classList.add("no-scroll")
        this.inputTarget.value = ''
        this.labelTarget.classList.remove("active");
        this.counterTarget.innerHTML = data.counter
        this.containerTarget.classList.add("blur")
        this.containerTarget.insertAdjacentHTML("afterend", data.popup)
        if (this.hasNoticeTarget) {
          this.noticeTargets.forEach(notice => {
            notice.remove()
          });
        }
      } else {
        this.containerTarget.insertAdjacentHTML("afterend", data.alert)
      }
    });
  }


  hidePopup() {
    this.bodyTarget.classList.remove("no-scroll")
    this.containerTarget.classList.remove("blur")
    if (this.hasPopupTarget) {
      this.popupTarget.remove()
    }
  }

}
