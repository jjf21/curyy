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
    document.querySelector("#cv_body").style.background = "url(/patterns/"+ patternSrc +")";
  }

  changeHeaderBg() {
    document.querySelector("#cv_header").style.background = this.inputTarget.value;
  }

  changeBodyBg() {
    document.querySelector("#cv_body").style.background = this.inputTarget.value;
  }

  changeTextColor() {
    document.querySelector("#cv_body").style.color = this.inputTarget.value;
  }

  changeMainColor() {
    var color = this.inputTarget.value
    let css = `<style>.text-main{ color: ${color}; } .bg-main{ background: ${color};}<style>`
    document.querySelector(".page").insertAdjacentHTML("beforeend", css)
  }


  setColor(e) {
    if (e.target.dataset.color) {
      this.inputTarget.value = e.target.dataset.color
    }

    let attr = this.inputTarget.dataset.attr;
    if ( attr == "body_bg" ) {
      this.changeBodyBg()
    } else if ( attr == "header_bg" ) {
      this.changeHeaderBg()
    } else if ( attr == "text_color" ) {
      this.changeTextColor()
    } else if ( attr == "main_color" ) {
      this.changeMainColor()
    }
  }

}
