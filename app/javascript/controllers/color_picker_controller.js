import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "input" , "picker_container", "picker_icon", "palette"]

  connect() {
    this.setPaletteBackground()
  }

  initialize() {
  }

  changeBackground() {
    var color = "#fff"
    if (/^#[0-9A-F]{6}$/i.test(this.inputTarget.value)) { color = this.inputTarget.value }
    document.querySelector(".page").style.background = color;
    this.updateModel()
  }

  changeTextColor() {
    var color = "#000000"
    if (/^#[0-9A-F]{6}$/i.test(this.inputTarget.value)) { color = this.inputTarget.value }
    document.querySelector(".page").style.color = color;
    this.updateModel()
  }

  changeMainColor() {
    var color = "#ccb68c"
    if (/^#[0-9A-F]{6}$/i.test(this.inputTarget.value)) { color = this.inputTarget.value }
    let css = `<style>.text-main{ color: ${color}; } .bg-main{ background: ${color};}<style>`
    document.querySelector(".page").insertAdjacentHTML("beforeend", css)
    this.updateModel()
  }

  togglePalette() {
    this.paletteTarget.classList.toggle('hidden');
  }

  setPaletteBackground() {
    this.picker_containerTarget.style.background = this.inputTarget.value
  }

  setColor(e) {
    if (e.target.dataset.color) {
      this.inputTarget.value = e.target.dataset.color
    }

    this.setPaletteBackground()
    let attr = this.inputTarget.dataset.attr;
    if ( attr == "background" ) {
      console.log('background')
      this.changeBackground()
    } else if ( attr == "text_color" ) {
      console.log('text')
      this.changeTextColor()
    } else if ( attr == "main_color" ) {
      this.changeMainColor()
    }
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
