# frozen_string_literal: true

class ApplicationController < ActionController::API
  # Include default headers by default
  def self.make_response!(request)
    ActionDispatch::Response.create.tap do |res|
      res.request = request
    end
  end
end
