import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "input" , ]

  connect() {
  }

  initialize() {
  }

  patternSelect(e){
    let pattern = e.target.dataset.name
    this.changeBgPattern(pattern)
    this.inputTarget.value = e.target.dataset.name
    this.inputTarget.dispatchEvent(new Event('change'));
  }

  changeBgPattern(patternSrc) {
    if (patternSrc) {
      document.querySelector("#cv_body").style.background = "url(/patterns/"+ patternSrc +")";
      document.querySelector("#cv_header").style.background = "url(/patterns/"+ patternSrc +")";
    }
  }


  setColor(e) {
    if (e.target.dataset.color) {
      this.inputTarget.value = e.target.dataset.color
    }
    let attr = this.inputTarget.dataset.attr.replaceAll('_', '-');

    let css = `:root { --${attr}: ${this.inputTarget.value}; }`
    document.querySelector('style#variables').appendChild(document.createTextNode(css));
  }

  updateModel() {
    let attr = this.inputTarget.dataset.attr;
    let cv_id = document.querySelector("#cv_id").value
    let formData = new FormData()
    formData.append(`cv[${attr}]`, this.inputTarget.value);

    fetch(`/cvs/${cv_id}`, {
      body: formData,
      method: 'PATCH',
      dataType: 'script',
      credentials: "include",
      headers: {
        "X-CSRF-Token": document.getElementsByName("csrf-token")[0].content
      },
    })
  }
}
