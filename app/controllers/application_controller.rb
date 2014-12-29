class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_category_menu

  

  protected

  def get_category_menu
    main_taxon = Spree::Taxonomy.find_by(name: "Kategorie")
    @categories = Spree::Taxon.where( parent_id: main_taxon.id) rescue []
  end

  def get_company_menu
  end

end
