class EmailapiController < ApplicationController
  def index
  end

  def subscribe
    @list_id = ENV["SS_MAILCHIMP_LIST_ID"]
    gb = Gibbon::API.new

    gb.lists.subscribe({
      :id => @list_id,
      :email => {:email => params[:email][:address]}
      })
    respond_to do |format|
      format.html {redirect_to '/'}
      flash[:alert] = "Subscribed! Please check your email to verify your subscription."
      flash.keep(:alert) # Keep flash notice around for the redirect.
      format.js {render :js => "window.location.href='/'"} 
  end

  end
end
