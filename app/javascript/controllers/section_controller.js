import { Controller } from "@hotwired/stimulus"

import { hoverSectionMenu } from "../lib/hover_menus"

export default class extends Controller {

  connect() {
    hoverSectionMenu(this.element)
  }
}
