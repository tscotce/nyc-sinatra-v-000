class LandmarksController < ApplicationController
  # add controller methods
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end
  
  get '/landmarks/new' do
    @figures = Figure.all
    erb :"landmarks/new"
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    # if !params["pet"]["name"].empty?
    #   @owner.pets << Pet.create(name: params["pet"]["name"])
    # end
    redirect "landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    # @figure = @landmark.figures
    # @title = @figure.titles
    # @landmarks = Landmark.all
    # @titles = Title.all
    erb :"landmarks/edit"
  end
  
  patch '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params["landmark"]["name"], year_completed: params["year_completed"])
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end
  
end
