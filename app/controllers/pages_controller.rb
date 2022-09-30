# frozen_string_literal: true

class PagesController < ApplicationPublicController
  def root; end

  def contact
    set_meta_tags title: "Contact", description: "Formulaire de prise de contact avec l'équipe Curyy"
  end

  def terms
    set_meta_tags title: "Conditions générales d'utilisations"
  end

  def legal_notices
    set_meta_tags title: "Mentions légales"
  end

  def service
    set_meta_tags title: "Concepteur de CV en ligne"
  end

  def examples
    @examples = Article.all
    set_meta_tags title: "Exemples de CV en ligne", description: "Retrouvez ici une selection d'exemples de CV pour vous inspirer lors de l'écriture de votre CV"
  end
end
