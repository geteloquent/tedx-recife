class ContactsController < ApplicationController
  respond_to :js

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.valid?
      @contact.deliver
      flash[:success] = 'Obrigado pela sua mensagem, responderemos em breve. :)'
    end
  end
end
