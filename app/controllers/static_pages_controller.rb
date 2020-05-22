class StaticPagesController < ApplicationController
  def welcome
  end

  def texts
    @page_title       = 'Texte & Argumente'
    @page_description = 'Eine Übersicht aller Texte und Argumente auf Fokus Tierethik'
    @page_keywords    = 'Tierethik, Argumente'
  end
end
