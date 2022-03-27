import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "input" , "picker_container", "picker_icon", "palette"]

  connect() {
    console.log("Connect Color Picker")
  }

  initialize() {
  }

  changeBackground() {
    var color = "#fff"
    if (/^#[0-9A-F]{6}$/i.test(this.inputTarget.value)) { color = this.inputTarget.value }
    document.querySelector(".page").style.background = color;
  }

  changeTextColor() {
    var color = "#000"
    console.log(this.inputTarget.value)
    if (/^#[0-9A-F]{6}$/i.test(this.inputTarget.value)) { color = this.inputTarget.value }
    console.log(color)
    document.querySelector(".page").style.color = color;
  }

  togglePalette() {
    this.paletteTarget.classList.toggle('hidden')
  }

  setColor(e) {
    this.inputTarget.value = e.target.dataset.color
    this.picker_containerTarget.style.background = e.target.dataset.color
    this.changeBackground()
  }

}

// changeBackground() {
//   var correctColor = false
//   if (/^#[0-9A-F]{6}$/i.test(this.inputTarget.value)) { correctColor = true }
//
//   var attr = this.inputTarget.dataset.attr;
//   if ( attr == "background" ) {
//     var color = correctColor ? this.inputTarget.value : "#fff"
//     document.querySelector(".page").style.background = color;
//   }
//
// }