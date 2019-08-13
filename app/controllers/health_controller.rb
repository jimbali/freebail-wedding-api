class HealthController < ApplicationController
  def index
    render json: [{ health: 'ok' }]
  end
end
