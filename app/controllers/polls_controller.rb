class PollsController < ApplicationController
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        format.html { redirect_back(fallback_location: root_path, flash: { success: '¡Muchas gracias por responder nuestra encuesta!' }) }
      else
        format.html { raise 'too bad m8'.inspect }
      end
    end
  end

  private
    def poll_params
      params.require(:poll).permit(:name, :email, :origin, travel_preference_list: [])
    end
end
