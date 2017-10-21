class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]
  def index
    # @pictures = Picture.all
    @user = User.all
    @pictures = Picture.most_recent_five

    one_month = 1.month.ago
    @month_old = Picture.created_before(one_month)

  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    # byebug
    # render text: "Received POST request to \"/pictures\" with the data URL: #{params}"

    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.user_id = current_user.id


    if @picture.save
      #if the  pictures gets save, generate a fet request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      #otherwise render new.html.erb
      render :new
    end
  end

  def edit
  end

  def update

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end

  end

  def destroy
    @picture.destroy
    redirect_to "/pictures"
  end

end
