import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "source" ]

  connect() {
    console.log("Connect Color Picker")
  }

  initialize() {
  }

  changeBackground() {
    var color = "#fff"
    if (/^#[0-9A-F]{6}$/i.test(this.sourceTarget.value)) { color = this.sourceTarget.value }
    document.querySelector(".page").style.background = color;
  }

  changeTextColor() {
    var color = "#000"
    console.log(this.sourceTarget.value)
    if (/^#[0-9A-F]{6}$/i.test(this.sourceTarget.value)) { color = this.sourceTarget.value }
    console.log(color)
    document.querySelector(".page").style.color = color;
  }

}

// changeBackground() {
//   var correctColor = false
//   if (/^#[0-9A-F]{6}$/i.test(this.sourceTarget.value)) { correctColor = true }
//
//   var attr = this.sourceTarget.dataset.attr;
//   if ( attr == "background" ) {
//     var color = correctColor ? this.sourceTarget.value : "#fff"
//     document.querySelector(".page").style.background = color;
//   }
//
// }