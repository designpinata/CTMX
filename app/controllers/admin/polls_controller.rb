class Admin::PollsController < AdminController
  before_action :set_admin_poll, only: [:show, :edit, :update, :destroy]

  # GET /admin/polls
  def index
    @polls = Poll.all
  end

  # GET /admin/polls/1
  def show
  end

  # GET /admin/polls/1/edit
  def edit
  end

  # PATCH/PUT /admin/polls/1
  def update
    respond_to do |format|
      if @poll.update(admin_poll_params)
        format.html { redirect_to admin_poll_path(@poll),  flash: { success: 'La respuesta se actualizó con éxito!' } }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/polls/1
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to admin_polls_url, notice: 'La encuesta fue destruido con éxito!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_poll
      @poll = Poll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_poll_params
      params.require(:poll).permit(:name, :email, :origin, travel_preference_list: [])
    end
end
