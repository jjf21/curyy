# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: "Curyy, démarquez votre CV",
      title: "",
      reverse: true,
      separator: "-",
      description: "Curyy est un outil de conception premium de CV (curriculum vitae) en ligne. Il permet de choisir un thème, modifier son design, remplir vos expériences et télécharger votre CV au format PDF.",
      keywords: "cv design curriculum vitae recrutement theme",
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url("/favicon.ico") },
        { href: image_url("/favicon.ico"), rel: "apple-touch-icon", sizes: "180x180", type: "image/ico" },
      ],
      og: {
        site_name: "Curyy.com",
        title: "Curyy",
        description: "Curyy est un outil de conception premium de CV (curriculum vitae) en ligne. Il permet de choisir un thème, modifier son design, remplir vos expériences et télécharger votre CV au format PDF.",
        type: "website",
        url: request.original_url,
        image: image_url("/og-image.png"),
      },
    }
  end

  def editable_tag(item, attribute, &block)
    if block_given?
      target = "##{dom_id(item)}_cv_item form ##{item.class.to_s.downcase}_#{attribute}"

      content_tag(:div, class: "inline-block", data: { controller: "editable", action: "click->editable#click blur->editable#blur keydown->editable#keydown", target: }) do
        block.call
      end
    end
  end
end
