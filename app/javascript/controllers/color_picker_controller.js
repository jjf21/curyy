import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "source" ]

  connect() {
    console.log("Connect Color Picker")
  }

  initialize() {
    this.changeBackground()
  }

  changeBackground() {
    var color = "#FFF"
    if (/^#[0-9A-F]{6}$/i.test(this.sourceTarget.value)) { color = this.sourceTarget.value }
    document.querySelector(".page").style.background = color;

  }

}

