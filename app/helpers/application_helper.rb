# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: I18n.t("app.meta.title"),
      title: "",
      reverse: true,
      separator: "-",
      description: I18n.t("app.meta.description"),
      keywords: I18n.t("app.meta.keywords"),
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url("/favicon.ico") },
        { href: image_url("/favicon.ico"), rel: "apple-touch-icon", sizes: "180x180", type: "image/ico" },
      ],
      og: {
        site_name: "Curyy.com",
        title: "Curyy",
        description: I18n.t("app.meta.description"),
        type: "website",
        url: request.original_url,
        image: image_url("/og-image.png"),
      },
    }
  end

  def editable_tag(item, attribute, file: false, &block)
    return unless block_given?

    empty_attribute = item.send(attribute).blank?
    placeholder = item.class.human_attribute_name(attribute)
    target = "##{dom_id(item)}_cv_item form ##{item.class.to_s.downcase}_#{attribute}"
    click_action = file ? "clickFile" : "click"

    content_tag(:div, class: "inline-block #{"relative empty" if !file && empty_attribute}", data: { placeholder:, controller: "editable", action: "click->editable##{click_action} blur->editable#blur keydown->editable#keydown", target: }) do
      block.call
    end
  end
end
