require 'swagger_helper'

describe 'Guests API' do

  path '/guests' do

    get 'List guests' do
      tags 'Guests'
      produces 'application/json'

      response '200', 'guests found' do
        schema type: :array,
          items: {
            properties: {
              freebail: { type: :string }
            }
          }

        run_test!
      end
    end
  end
end