# frozen_string_literal: true

class IpController < ApplicationController
  def index
    render json: [
      {
        remote_ip: request.remote_ip,
        env: request.env.inspect
      }
    ]
  end
end
