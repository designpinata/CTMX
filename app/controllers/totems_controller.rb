class TotemsController < ApplicationController
  before_action :load_totem, only: [:show, :tip]

  def show
  end

  def tip
    @tip = @totem.tips.new(tip_params)

    respond_to do |format|
      if @tip.save
        format.html { redirect_back(fallback_location: root_path, flash: { success: '¡Muchas gracias por enviar tu tip!' }) }
      else
        format.html { redirect_back(fallback_location: root_path, flash: { error: 'Hubo un problema al enviar tu tip, inténtalo nuevamente' }) }
      end
    end
  end

  def shortcut
    circuit = Circuit.find_by(shortcut: params[:circuit_shortcut])
    @totem = circuit.totems.find_by(shortcut: params[:totem_shortcut])
    redirect_to circuit_totem_path(circuit, @totem, anchor: 'infographic-modal')
  end

  private
    def load_totem
      @totem = Totem.find_by(slug: params[:slug])
    end

    def tip_params
      params.require(:tip).permit(:rate, :content)
    end
end
