class ColorInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_html_options[:class].push("rounded-l-none") #Add class to input
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    # Custom  tags
    icon = tag.i height: "15", width: "15", data: { feather: "droplet", color_picker_target: "picker_icon" }
    picker = tag.span(icon, class:"flex items-center justify-center rounded-l border border-r-0 transition w-8", data: { color_picker_target: "picker_container", action: "click->color-picker#togglePalette" } )

    default_colors = ["#FFFFFF", "#CBE4F9", "#CDF5F6", "#EFF9DA", "#FF8066", "#FFE5D9", "#005B8A"]
    color_tags = default_colors.map{|color| tag.span('', style:"background-color: #{color}", class:"rounded-full h-4 w-4 inline-block border", data: { color: color, action: "click->color-picker#setColor"})}.join('').html_safe
    palette = tag.div(color_tags, class:"flex justify-evenly mt-2 transition hidden", data: { color_picker_target: "palette"})

    # Merge all
    content = @builder.text_field(attribute_name, merged_input_options)
    tag.div(picker + content , class: "flex items-strecth") + palette
  end
end
