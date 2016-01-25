class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def index
    @images = current_user.images
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Image Saved!"
      redirect_to images_path
    else
      flash[:danger] = "Error Occured"
      render 'new'
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    flash[:success] = "Image removed"
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:image, :user_id, :description)
  end
end
