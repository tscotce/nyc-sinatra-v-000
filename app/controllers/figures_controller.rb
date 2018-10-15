class FiguresController < ApplicationController
  # add controller methods
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end
  
  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    redirect "figures/#{@figure.id}"
  end
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end
  
  get '/figures/:id/edit' do 
    @figure = Figure.find(params[:id])
    @landmark = @figure.landmarks
    @title = @figure.titles
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/edit"
  end
  
  patch '/figures/:id' do 
    @figure.update(name: params["figure"]["name"])

    redirect to "figures/#{@figure.id}"
  end
  
end
