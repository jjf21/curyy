module ApplicationHelper
  def feather(name, **kwargs)
    tag.i(data: { feather: name, **kwargs[:data].to_h }, **kwargs.except(:data))
  end



  def editable_tag(item, attribute, &block)
    if block_given?
      target = "##{dom_id(item)}_cv_item form ##{item.class.to_s.downcase}_#{attribute}"

      content_tag(:div, class:'inline-block', data: {controller: 'editable', action: 'click->editable#click blur->editable#blur keydown->editable#keydown', target: target }) do
        block.call
      end
    end
  end
end
