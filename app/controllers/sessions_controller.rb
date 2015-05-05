class SessionsController < ApplicationController

  def new
  end

  def create
    uri = "#{API_BASE_URL}/sessions"
    # converting the params to json
    payload = params.to_json 
    rest_resource = RestClient::Resource.new(uri) 
    begin
      
      rest_resource.post payload , :content_type => "application/json"
      binding.pry
      @user= JSON.parse(RestClient.get("#{API_BASE_URL}/users/#{params[:id]}", {:accept => :json})).symbolize_keys
      flash[:notice] = "Login Successful"
      
    rescue Exception => e
      binding.pry
     flash[:error] = "Login Failed"
     render :new
    end
  end


  def destroy
    # reset_session
    # redirect_to root_path
  end

end