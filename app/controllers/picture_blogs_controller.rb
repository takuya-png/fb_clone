class PictureBlogsController < ApplicationController
  before_action :set_picture_blog, only: %i[ show edit update destroy ]

  def index
    @picture_blogs = PictureBlog.all
  end

  def show
  end

  def new
    @picture_blog = PictureBlog.new
  end

  def edit
  end

  def create
    @picture_blog = PictureBlog.new(picture_blog_params)

    respond_to do |format|
      if @picture_blog.save
        format.html { redirect_to @picture_blog, notice: "Picture blog was successfully created." }
        format.json { render :show, status: :created, location: @picture_blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @picture_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @picture_blog.update(picture_blog_params)
        format.html { redirect_to @picture_blog, notice: "Picture blog was successfully updated." }
        format.json { render :show, status: :ok, location: @picture_blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @picture_blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture_blog.destroy
    respond_to do |format|
      format.html { redirect_to picture_blogs_url, notice: "Picture blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_picture_blog
      @picture_blog = PictureBlog.find(params[:id])
    end

    def picture_blog_params
      params.require(:picture_blog).permit(:title, :content, :image)
    end
end
