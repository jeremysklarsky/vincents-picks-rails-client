class UsersController < ApplicationController

  def new
    @url = "#{API_BASE_URL}/users"
  end

  def show
    @user = JSON.parse(RestClient.get("#{API_BASE_URL}/users/#{params[:id]}", {:accept => :json})).symbolize_keys    
  end

  def create
    uri = "#{API_BASE_URL}/users"
    # converting the params to json
    binding.pry
    payload = params.to_json 
    rest_resource = RestClient::Resource.new(uri)
    binding.pry
    begin
      rest_resource.post payload , :content_type => "application/json"
      flash[:notice] = "User Saved successfully"
      redirect_to root_path
    rescue Exception => e
     flash[:error] = "User Failed to save"
     render :new
    end



    
  end

end