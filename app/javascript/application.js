// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./components/application"


document.addEventListener("turbo:load", function() {

  if (document.querySelectorAll('[data-coloris]').length > 0) {
    Coloris({
      alpha: false,
      swatches: [
        'white',
        'black',
        '#354856',
        '#cfb482',
        '#e76f51',
        '#d62828',
        'navy',
        '#07b',
        '#0096c7',
      ]
    })
  }

});
