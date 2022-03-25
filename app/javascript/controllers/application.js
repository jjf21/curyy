import { Application } from "@hotwired/stimulus"

import ColorPickerController from "./color_picker_controller"

const application = Application.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus = application


Stimulus.register("color-picker", ColorPickerController)

export { application }
