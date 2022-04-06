import { Application } from "@hotwired/stimulus"

import ColorPickerController from "./color_picker_controller"
import SettingPannelController from "./setting_pannel_controller"
import CvZoomController from "./cv_zoom_controller"
import Editable from "./editable_controller"

const application = Application.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

Stimulus.register("color-picker", ColorPickerController)
Stimulus.register("setting-pannel", SettingPannelController)
Stimulus.register("cv-zoom", CvZoomController)
Stimulus.register("editable", Editable)

export { application }
