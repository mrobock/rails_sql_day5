class ContactsController < ApplicationController

  def sort
    Contact.order(:family_name).all
    redirect_to '/'
  end

  def index
    @contacts = Contact.all
  end

  def add
    @contact = Contact.new
    if params[:given_name].empty? || params[:family_name].nil?
      flash[:alert] = "You idiot, you need a first name"
      redirect_to '/' and return
    else
      @contact.given_name = params[:given_name]
    end
    if params[:family_name].empty? || params[:family_name].nil?
      flash[:alert] = "You idiot, you need a last name"
      redirect_to '/' and return
    else
      @contact.family_name = params[:family_name]
    end
    @contact.address = params[:address]
    @contact.email = params[:email]
    if @contact.save
      redirect_to '/'
    else
      render text: "You suck"
    end
  end

  def update
    @contact = Contact.find_by_family_name(params[:update_1])
    if !params[:given_name_update].empty?
      @contact.given_name = params[:given_name_update]
    end
    if !params[:family_name_update].empty?
      @contact.family_name = params[:family_name_update]
    end
    if !params[:address_update].empty?
      @contact.address = params[:address_update]
    end
    if !params[:email_update].empty?
      @contact.email = params[:email_update]
    end
    @contact.save
    redirect_to '/'
  end

  def destroy
    @contact = Contact.find_by_family_name(params[:destroy_1])
    Contact.destroy(@contact)
    redirect_to '/'
  end



end
