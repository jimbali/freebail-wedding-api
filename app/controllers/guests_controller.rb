# frozen_string_literal: true

class GuestsController < ApplicationController
  def show
    guest = Guest.find_by(invite_code: params[:invite_id])
    return render status: :not_found if guest.nil?

    render json: { guest: guest.redacted }
  end

  def update
    guest = Guest.find_by(invite_code: params[:invite_id])
    return render status: :not_found if guest.nil?

    return head :unprocessable_entity unless params_present?

    guest.update!(
      params.permit(:email, :street, :town, :county, :postcode, :country)
    )

    head :no_content
  end

  def params_present?
    %i[street town county postcode].all? { |k| params.key? k }
  end
end
