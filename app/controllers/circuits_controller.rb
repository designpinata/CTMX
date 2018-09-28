class CircuitsController < ApplicationController
  before_action :load_circuit, only: [:show, :discover]

  def show
  end

  def discover
  end

  private
    def load_circuit
      @circuit = Circuit.find_by(slug: params[:slug])
    end
end
