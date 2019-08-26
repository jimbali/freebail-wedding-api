# frozen_string_literal: true

class GuestsController < ApplicationController
  def show
    guest = Guest.find_by(invite_code: params[:invite_id])
    return render status: :not_found if guest.nil?

    render json: { guest: guest }
  end
end
