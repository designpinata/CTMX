class Admin::InstagramsController < AdminController
  before_action :set_admin_instagram, only: [:show, :edit, :update, :destroy]

  # GET /admin/instagrams/1
  def show
  end

  # GET /admin/instagrams/1/edit
  def edit
  end

  # PATCH/PUT /admin/instagrams/1
  def update
    respond_to do |format|
      if @instagram.update(admin_instagram_params)
        format.html { redirect_back(fallback_location: admin_totem_instagram_path(@instagram.totem, @instagram),  flash: { success: 'La foto de instagram se actualizó con éxito!' }) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/instagrams/1
  def destroy
    totem = @instagram.totem
    @instagram.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: admin_totem_instagram_path(@instagram.totem, @instagram), flash: { notice: 'La foto de instagram fue destruida con éxito!' }) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_instagram
      @instagram = Instagram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_instagram_params
      params.require(:instagram).permit(:content, :rate, :approved)
    end
end
