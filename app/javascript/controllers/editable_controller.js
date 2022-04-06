import { Controller } from "@hotwired/stimulus"

import { hoverItemMenu } from "../lib/hover_item_menu"

export default class extends Controller {
  connect() {
    // hoverItemMenu(this.element)
  }

  click(event) {
    console.log("click")
    this.element.setAttribute("contenteditable", "true")
    this.element.focus()
  }

  blur(event) {
    console.log("blur")
    this.element.removeAttribute("contenteditable")
    this.save()
  }

  keydown(event) {
    console.log("keydown")
    if (event.keyCode == 13) {
      event.preventDefault()
      this.element.removeAttribute("contenteditable")
    }
  }

  save() {
    let input = document.querySelector(this.element.dataset.target)
    let form = input.closest('form')
    input.value = this.element.textContent
    form.querySelector('input[type="submit"]').click()
  }
}
