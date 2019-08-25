# frozen_string_literal: true

class GuestsController < ApplicationController
  def show
    return render status: 404 if params[:invite_id] != '1'

    render json: [{ freebail: 'wedding' }]
  end
end
