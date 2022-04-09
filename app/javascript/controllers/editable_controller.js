import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  click(event) {
    if (this.preventDoubleClick()) return;

    console.log("click")
    this.element.setAttribute("contenteditable", "true")
    this.element.focus()
  }

  blur(event) {
    console.log("blur")
    this.element.removeAttribute("contenteditable")
    window.sessionStorage.setItem('lastEdit', Date.now())
    this.save()
  }

  keydown(event) {
    console.log("keydown")
    // if (event.keyCode == 13) {
    //   event.preventDefault()
    //   this.element.removeAttribute("contenteditable")
    // }
  }

  preventDoubleClick() {
    // Prevent click on field while turbo reload frame and dismiss content editable
    var lastEdit = window.sessionStorage.getItem('lastEdit')
    return (Date.now() - lastEdit) < 500
  }

  save() {
    let input = document.querySelector(this.element.dataset.target)
    let form = input.closest('form')
    input.value = this.element.textContent
    form.querySelector('input[type="submit"]').click()
  }
}
