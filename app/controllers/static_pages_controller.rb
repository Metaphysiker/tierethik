class StaticPagesController < ApplicationController
  def welcome
    image = ActionController::Base.helpers.asset_url("pigs.jpg", type: :image)

    set_meta_tags title: "Fokus Tierethik", reverse: true,
              description: "Fokus Tierethik ist ein Portal für Tierethik und Tierschutz-Aktivismus.",
              og: {
                title: :title,
                description: :description,
                url: root_path,
                image: image
              }
  end

  def texts
    @page_title       = 'Texte & Argumente'
    @page_description = 'Eine Übersicht aller Texte und Argumente auf Fokus Tierethik'
    @page_keywords    = 'Tierethik, Argumente'
  end

  def debate_a_vegan

  end

  def dashboard
    authorize :static_page, :dashboard?

  end
end
