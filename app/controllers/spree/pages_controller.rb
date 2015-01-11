class Spree::PagesController < Spree::StoreController
  def show
    @page = Page.find_by(slug: params[:slug])
  end

  def contact
    @contact = Contact.new
  end

  def contact_send
    @contact = Contact.new contact_params
    ContactMailer.contact(@contact.email, @contact.body, @contact.title).deliver
    if @contact.save
      redirect_to contact_path, notice: "Wiadomość wysłana"
    else
      render action: "contact"
    end
  end

  protected

  def contact_params
    params.require(:contact).permit(:email, :body, :title)
  end
end