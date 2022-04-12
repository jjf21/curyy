SimpleForm.setup do |config|
  config.wrappers :default, class: 'input_wrapper', hint_class: :field_with_hint, error_class: :field_with_errors, valid_class: :field_without_errors do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'label'
    b.use :error, wrap_with: { tag: :span, class: 'error text-primary-light text-xs italic' }
    b.use :input, class: 'field', error_class: 'is-invalid', valid_class: 'is-valid'
    b.use :hint,  wrap_with: { tag: :span, class: :hint }
  end

  config.default_wrapper = :default
  config.boolean_style = :nested
  config.button_class = "btn"
  config.error_notification_tag = :div
  config.error_notification_class = "error_notification"
  config.browser_validations = true
  config.boolean_label_class = "checkbox"

  config.label_text = lambda { |label, required, explicit_label| "#{label} #{ "<i class='gg-asterisk' style='--ggs:0.5'></i>" if required}"   }
end
