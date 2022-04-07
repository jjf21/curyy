import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
  }

  changeTheme() {
    let input = document.querySelector('#cv_theme_id')
    let form = input.closest('form')
    input.value = this.element.dataset.id
    form.querySelector('input[type="submit"]').click()
  }

  toggleSelector() {
    this.element.parentElement.firstChild.classList.toggle('hidden')
  }
}
