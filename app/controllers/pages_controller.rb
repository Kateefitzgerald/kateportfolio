class PagesController < ApplicationController
   skip_before_action :verify_authenticity_token
  def cv
    render template: "pages/cv"
  end

  def home
    @contact = ContactForm.new(params[:contact_form])
  end


def create
    @contact = ContactForm.new(params[:contact_form])
    @contact.request = request
      if @contact.deliver
        # re-initialize Home object for cleared form
        flash.now[:error] = nil
        redirect_to home_path, notice: 'Message sent successfully'
        else
        flash.now[:error] = 'Cannot send message'
        render :new
      end
  end
end
