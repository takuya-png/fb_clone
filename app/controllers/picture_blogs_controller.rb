class PictureBlogsController < ApplicationController
  before_action :set_picture_blog, only: %i[ show edit update destroy ]

  # GET /picture_blogs or /picture_blogs.json
  def index
    @picture_blogs = PictureBlog.all
  end

  # GET /picture_blogs/1 or /picture_blogs/1.json
  def show
  end

  # GET /picture_blogs/new
  def new
    @picture_blog = PictureBlog.new
  end

  # GET /picture_blogs/1/edit
  def edit
  end

  # POST /picture_blogs or /picture_blogs.json
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

  # PATCH/PUT /picture_blogs/1 or /picture_blogs/1.json
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

  # DELETE /picture_blogs/1 or /picture_blogs/1.json
  def destroy
    @picture_blog.destroy
    respond_to do |format|
      format.html { redirect_to picture_blogs_url, notice: "Picture blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture_blog
      @picture_blog = PictureBlog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_blog_params
      params.require(:picture_blog).permit(:title, :content, :image)
    end
end
