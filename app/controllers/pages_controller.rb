class PagesController < ApplicationController
  before_action :load_page, only: [:show]

  def home
    @main_circuit = Circuit.first
  end

  def show
    if @page.nil?
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  def sitemap
    @circuits = Circuit.includes(:totems)
    @pages = Page.all
  end

  private
    def load_page
      @page = Page.find_by(slug: params[:slug])
    end
end
