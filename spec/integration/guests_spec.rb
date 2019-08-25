# frozen_string_literal: true

require 'swagger_helper'

describe 'Guests API' do
  path '/api/guests/{invite_id}' do
    get 'Show guest' do
      tags 'Guests'
      produces 'application/json'
      parameter name: :invite_id, in: :path, type: :integer

      response '200', 'guest found' do
        let(:invite_id) { 1 }

        schema type: :array,
               items: {
                 properties: {
                   guest: { name: :string }
                 }
               }

        run_test!
      end

      response '404', 'guest not found' do
        let(:invite_id) { -1 }
        run_test!
      end
    end
  end
end
