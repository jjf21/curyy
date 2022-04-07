import { Application } from "@hotwired/stimulus"

import ColorPickerController from "./color_picker_controller"
import SettingsController from "./settings_controller"
import CvZoomController from "./cv_zoom_controller"
import Editable from "./editable_controller"
import Item from "./item_controller"
import Section from "./section_controller"
import Theme from "./theme_controller"

const application = Application.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

Stimulus.register("color-picker", ColorPickerController)
Stimulus.register("settings", SettingsController)
Stimulus.register("cv-zoom", CvZoomController)
Stimulus.register("editable", Editable)
Stimulus.register("item", Item)
Stimulus.register("section", Section)
Stimulus.register("theme", Theme)

export { application }
