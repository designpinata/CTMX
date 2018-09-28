class Admin::CircuitsController < AdminController
  before_action :set_admin_circuit, only: [:show, :edit, :update, :destroy]

  # GET /admin/circuits
  def index
    @circuits = Circuit.includes(:totems)
  end

  # GET /admin/circuits/1
  def show
  end

  # GET /admin/circuits/new
  def new
    @circuit = Circuit.new
  end

  # GET /admin/circuits/1/edit
  def edit
  end

  # POST /admin/circuits
  def create
    @circuit = Circuit.new(admin_circuit_params)

    respond_to do |format|
      if @circuit.save
        format.html { redirect_to admin_circuit_path(@circuit), flash: { success: 'El circuito fue creado con éxito!' } }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/circuits/1
  def update
    respond_to do |format|
      if @circuit.update(admin_circuit_params)
        format.html { redirect_to admin_circuit_path(@circuit),  flash: { success: 'El circuito se actualizó con éxito!' } }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/circuits/1
  def destroy
    @circuit.destroy
    respond_to do |format|
      format.html { redirect_to admin_circuits_url, notice: 'El circuito fue destruido con éxito!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_circuit
      @circuit = Circuit.find_by(slug: params[:slug])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_circuit_params
      params.require(:circuit).permit(:name, :subtitle, :shortcut, :content_title, :content_subtitle, :content, :header_image, :content_header_image, circuit_images_attributes: [:id, :image, :_destroy])
    end
end
