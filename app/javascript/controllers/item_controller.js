import { Controller } from "@hotwired/stimulus"

import { hoverItemMenu } from "../lib/hover_menus"

export default class extends Controller {

  connect() {
    hoverItemMenu(this.element)
  }
}
