# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe '#redacted' do
    let(:guest) { create(:guest) }

    it 'only has the allowed fields' do
      expect(guest.redacted).to eq(
        'count' => guest.count,
        'id' => guest.id,
        'invite_code' => guest.invite_code,
        'invite_link' => guest.invite_link,
        'invite_sent' => guest.invite_sent,
        'name' => guest.name
      )
    end
  end
end
