class Spree::Admin::PagesController < Spree::Admin::BaseController
  
  before_action :set_page, only: [:edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_path, notice: "Strona zapiszana"
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path, notice: "Strona zapiszana"
    else
      redirect_to admin_pages_path, alert: "Wystąpił problem z edycją strony. Prosze skontaktować się z adminem"
    end
  end

  def destroy
    if @page.destroy
      redirect_to admin_pages_path, notice: "Strona usunięta"
    else 
      redirect_to admin_pages_path, alert: "Wystąpił problem z usunięciem strony. Prosze skontaktować się z adminem"
    end
  end

  protected

  def page_params
    params.require(:page).permit(:title, :slug, :desc, :keywords, :body)
  end

  def set_page
    @page = Page.find(params[:id])
  end


end
