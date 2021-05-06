class PictureBlogsController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @picture_blogs = PictureBlog.all
  end

  def show
  end

  def new
    if params[:back]
      @picture_blog = PictureBlog.new(picture_params)
    else
      @picture_blog = current_user.picture_blogs.build
    end
  end

  def edit
  end

  def create
    @picture = current_user.picture_blogs.build(picture_params)
    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @picture_blog.update(picture_params)
        format.html { redirect_to @picture_blog, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @picture_blog = current_user.picture_blogs.build(picture_params)
    render :new if @picture_blog.invalid?
  end

  private

  def set_picture
    @picture_blog = PictureBlog.find(params[:id])
  end

  def ensure_correct_user
    @picture_blog = PictureBlog.find(params[:id])
    if @picture_blog.user_id != current_user.id
      flash[:notice] = "No authority"
      redirect_to pictures_url
    end
  end

  def picture_params
    params.require(:picture_blog).permit(:content, :image, :image_cache)
  end
end