module ApplicationHelper


  FLASH_TYPE_HASH = { success: 'green', error: 'yellow', alert: 'red', notice: 'indigo' }.freeze

  def flash_type(flash_type)
    {
      success: { title: 'Opération réussi', color: 'green'},
      error: { title: "Une erreur s'est produite", color: 'red'},
      alert: { title: "Une erreur s'est produite", color: 'yellow'},
      notice: { title: "Opération réussi", color: 'green'}
    }[flash_type.to_sym]
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
