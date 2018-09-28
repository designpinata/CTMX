class Admin::TipsController < AdminController
  before_action :set_admin_tip, only: [:show, :edit, :update, :destroy]

  # GET /admin/tips/1
  def show
  end

  # GET /admin/tips/1/edit
  def edit
  end

  # PATCH/PUT /admin/tips/1
  def update
    respond_to do |format|
      if @tip.update(admin_tip_params)
        format.html { redirect_back(fallback_location: admin_totem_tip_path(@tip.totem, @tip),  flash: { success: 'El tip se actualizó con éxito!' }) }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/tips/1
  def destroy
    totem = @tip.totem
    @tip.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: admin_totem_path(totem), flash: { notice: 'El tip fue destruido con éxito!'}) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_tip
      @tip = Tip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_tip_params
      params.require(:tip).permit(:content, :rate, :approved)
    end
end
