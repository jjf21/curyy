// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

function adjustZoom() {
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
  document.querySelector("#cv_container").style.transform = "scale(" + zoomLevel + ")";
}
adjustZoom();

document.addEventListener('turbo:load', adjustZoom)
window.addEventListener("resize", adjustZoom);

document.addEventListener("turbo:before-stream-render", function(event) {
  // Add a class to an element we are about to add to the page
  // as defined by its "data-stream-enter-class"
  if (event.target.firstElementChild instanceof HTMLTemplateElement) {
    var enterAnimationClass = event.target.templateContent.firstElementChild.dataset.streamEnterClass
    if (enterAnimationClass) {
      event.target.templateElement.content.firstElementChild.classList.add(enterAnimationClass)
    }
  }

  // Add a class to an element we are about to remove from the page
  // as defined by its "data-stream-exit-class"
  var elementToRemove = document.getElementById(event.target.target)
  if (elementToRemove) {
    var streamExitClass = elementToRemove.dataset.streamExitClass
    if (streamExitClass) {
      // Intercept the removal of the element
      event.preventDefault()
      elementToRemove.classList.add(streamExitClass)
      // Wait for its animation to end before removing the element
      elementToRemove.addEventListener("animationend", function() {
        event.target.performAction()
      })
    }
  }
})
