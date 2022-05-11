import { Controller } from "@hotwired/stimulus"

import { convertHtmlToRaw } from "../lib/utils"

export default class extends Controller {
  click(event) {
    if (this.preventDoubleClick()) return;

    this.element.classList.remove("empty")
    console.log("click")
    this.element.setAttribute("contenteditable", "true")
    this.element.focus()
  }

  blur(event) {
    this.element.removeAttribute("contenteditable")
    window.sessionStorage.setItem('lastEdit', Date.now())
    this.save()
  }

  keydown(event) {
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
    if (input.type != 'file') {
      var value = ''
      if (this.element.dataset.placeholder == "description") {
        // Support multiline content for some fields
        value = convertHtmlToRaw(this.element.firstChild.innerHTML)
      } else {
        value = this.element.textContent
      }
      input.value = value
    }
    form.querySelector('input[type="submit"]').click()
  }

  clickFile() {
    let image = this.element.querySelector('.img')
    let input = document.querySelector(this.element.dataset.target)
    input.click()

    input.onchange = e => {
      var file = e.target.files[0];
      var reader = new FileReader();
      // reader.readAsText(file, 'UTF-8');
      reader.onload = e => {
        var content = e.target.result;
        // image.style.backgroundImage = 'url(' + content + ')';
        this.save()
      }

      reader.readAsDataURL(input.files[0]);
    }
  }
}
