require 'swagger_helper'

describe 'Guests API' do

  path '/api/health' do

    get 'Health check' do
      tags 'Health'
      produces 'application/json'

      response '200', 'health OK' do
        schema type: :array,
          items: {
            properties: {
              health: { type: :string }
            }
          }

        run_test!
      end
    end
  end
end
