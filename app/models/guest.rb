# frozen_string_literal: true

class Guest < ApplicationRecord
  def redacted
    slice(:id, :name, :invite_code, :invite_link, :invite_sent, :count)
  end
end
