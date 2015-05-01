class MoviesController < ApplicationController

  def index
    @movies = JSON.parse(RestClient.get("#{API_BASE_URL}/movies", {:accept => :json}))["movies"].sort_by{|movie|movie["name"]}
  end

  def show
    @movie = JSON.parse(RestClient.get("#{API_BASE_URL}/movies/#{params[:id]}", {:accept => :json})).symbolize_keys
  end
end
