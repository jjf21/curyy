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
end
