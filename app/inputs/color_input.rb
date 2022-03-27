class ColorInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    p "input_html -> #{input_html_options}"
    p "wrapper_options -> #{wrapper_options}"
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    picker = tag.i "O", class: "bg-blue-500 px-3 py-1"
    content = @builder.text_field(attribute_name, merged_input_options)
    tag.div picker + content, class: "flex items-center"
  end
end