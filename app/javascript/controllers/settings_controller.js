import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "pannel", "btn" ]

  connect() {
    this.setAccordion()
    // this.setColorInput()
  }

  setAccordion() {
    const accordionBtns = document.querySelectorAll(".accordion");

    accordionBtns.forEach((accordion) => {
      accordion.onclick = function (e) {
        e.preventDefault()
        this.classList.toggle("is-open");

        let content = this.nextElementSibling;

        if (content.style.maxHeight) {
          //this is if the accordion is open
          content.style.maxHeight = null;
        } else {
          //if the accordion is currently closed
          content.style.maxHeight = content.scrollHeight + "px";
        }
      };
    });
  }

  setColorInput() {
  }

  resetThemeConfig() {
    let themeConfig = JSON.parse(document.querySelector('#theme-config').dataset.themeConfig)
    let event = new Event('input', { bubbles: true })

    Object.entries(themeConfig).forEach(entry => {
      const [key, value] = entry
      document.querySelector(`#cv_${key}`).value = value
      document.querySelector(`#cv_${key}`).dispatchEvent(event);
    });
    // this.save()
    // debugger
  }

  save() {
    let form = this.element.querySelector('form')
    form.querySelector('input[type="submit"]').click()
  }

}
