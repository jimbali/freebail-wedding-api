# frozen_string_literal: true

class ApplicationController < ActionController::API
  after_action :set_cors_headers

  # Include default headers by default
  def self.make_response!(request)
    ActionDispatch::Response.create.tap do |res|
      res.request = request
    end
  end

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] =
      'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
