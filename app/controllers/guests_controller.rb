class GuestsController < ApplicationController
  def index
    render json: [{ freebail: 'wedding' }]
  end
end
