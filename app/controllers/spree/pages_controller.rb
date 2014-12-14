class Spree::PagesController < Spree::StoreController
  def show
    @page = Page.find_by(slug: params[:slug])
  end
end