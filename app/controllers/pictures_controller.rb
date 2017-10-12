class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    # render text: "Received POST request to '/pictures' with the data URL: #{params}"

    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      #if the  pictures gets save, generate a fet request to "/pictures" (the index)
      redirect_to '/pictures'
    else
      #otherwise render new.html.erb
      render :new
    end
  end
end
