class Admin::TotemsController < AdminController
  before_action :set_admin_totem, only: [:show, :edit, :update, :destroy, :update_instagram]

  # GET /admin/totems
  def index
    @totems = Totem.includes(:circuit).order(:position)
  end

  # GET /admin/totems/1
  def show
  end

  # GET /admin/totems/new
  def new
    @totem = Totem.new
  end

  # GET /admin/totems/1/edit
  def edit
  end

  # POST /admin/totems
  def create
    @totem = Totem.new(admin_totem_params)

    respond_to do |format|
      if @totem.save
        format.html { redirect_to admin_totem_path(@totem), flash: { success: 'El totem fue creado con éxito!' } }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/totems/1
  def update
    respond_to do |format|
      if @totem.update(admin_totem_params)
        format.html { redirect_to admin_totem_path(@totem),  flash: { success: 'El totem se actualizó con éxito!' } }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/totems/1
  def destroy
    @totem.destroy
    respond_to do |format|
      format.html { redirect_to admin_totems_url, notice: 'El totem fue destruido con éxito!' }
    end
  end

  def sort
    params[:totem].each_with_index do |id, index|
      Totem.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  def update_instagram
    respond_to do |format|
      if @totem.update_instagram
        format.html { redirect_to admin_totem_path(@totem),  flash: { success: 'Las fotos de instagram se actualizaron con éxito!' } }
      else
        format.html { redirect_to admin_totem_path(@totem),  flash: { warning: 'Las fotos de instagram no se actualizaron' }  }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_totem
      @totem = Totem.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_totem_params
      params.require(:totem).permit(:hashtag, :name, :description, :shortcut, :circuit_id, :latitude, :longitude, :location, :manual_address, :infographic_text, :infographic, :main_image, :header_image, :content, totem_images_attributes: [:id, :image, :_destroy] )
    end
end
