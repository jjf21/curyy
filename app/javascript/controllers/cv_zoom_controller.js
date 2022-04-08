import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [ "pannel", "btn" ]

  connect() {
    this.adjustZoom()
    document.addEventListener('turbo:load', this.adjustZoom)
    window.addEventListener("resize", this.adjustZoom);

  }

  disconnect() {
    document.removeEventListener('turbo:load', this.adjustZoom)
    window.removeEventListener("resize", this.adjustZoom);
  }

  adjustZoom() {
    var documentWidth = document.querySelector('#cv_container').clientWidth;
    var documentHeight = document.querySelector('#cv_container').clientHeight;
    // 1cm = 37.795276px;
    // 21cm width + 1cm of margins each sides
    // 29.7cm height + 1cm of margins each sides
    var zoomWidth = documentWidth / (23 * 37.795276);
    var zoomHeight = documentHeight / (31.7 * 37.795276);
    var zoomLevel = Math.min(zoomWidth, zoomHeight);
    // stop zooming when book fits page
    if (zoomLevel >= 1) return;
    // document.querySelector("#cv_container").style.transform = "scale(" + zoomLevel + ")";
  }

}
