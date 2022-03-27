import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "pannel", "btn" ]

  connect() {
    console.log("Connect Setting Pannel")
  }

  initialize() {
  }

  toggleSetting() {
    console.log('Toggle', this.pannelTarget.classList)
    this.pannelTarget.classList.toggle('w-0')
    this.pannelTarget.classList.toggle('px-0')
    // this.pannelTarget.classList.toggle('hidden')
  }

}