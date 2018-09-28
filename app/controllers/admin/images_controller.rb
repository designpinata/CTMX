class Admin::ImagesController < AdminController
  before_action :set_admin_image, only: [:show, :edit, :update, :destroy]

  # GET /admin/images
  def index
    @images = Image.all
  end

  # GET /admin/images/1
  def show
  end

  # GET /admin/images/new
  def new
    @image = Image.new
  end

  # GET /admin/images/1/edit
  def edit
  end

  # POST /admin/images
  def create
    @image = Image.new(admin_image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to admin_image_path(@image), flash: { success: 'La imagen fue creada con éxito!' } }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/images/1
  def update
    respond_to do |format|
      if @image.update(admin_image_params)
        format.html { redirect_to admin_image_path(@image),  flash: { success: 'La imagen se actualizó con éxito!' } }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/images/1
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to admin_images_url, notice: 'La imagen fue destruida con éxito!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_image_params
      params.require(:image).permit(:title, :image)
    end
end
