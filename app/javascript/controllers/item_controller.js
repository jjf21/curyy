import { Controller } from "@hotwired/stimulus"

import { hoverItemMenu } from "../lib/hover_item_menu"

export default class extends Controller {

  connect() {
    console.log("Connect Item", this.element)
    // debugger
    hoverItemMenu(this.element)
  }
}
