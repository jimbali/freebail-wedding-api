# frozen_string_literal: true

require 'swagger_helper'

describe 'Guests API' do
  path '/api/guests/{invite_id}' do
    get 'Show guest' do
      tags 'Guests'
      produces 'application/json'
      parameter name: :invite_id, in: :path, type: :string

      response '200', 'guest found' do
        let!(:guest) { create(:guest) }
        let(:invite_id) { guest.invite_code }

        schema type: :object,
               properties: {
                 name: { type: :string }
               },
               required: ['name']
        run_test!
      end

      response '404', 'guest not found' do
        let(:invite_id) { 'boobityboop' }
        run_test!
      end
    end

    patch 'Update guest' do
      tags 'Guests'
      consumes 'application/json'
      parameter name: :invite_id, in: :path, type: :string
      parameter name: :input, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          street: { type: :string },
          town: { type: :string },
          county: { type: :string },
          postcode: { type: :string },
          country: { type: :string }
        },
        required: %w[street town county postcode]
      }

      response '204', 'guest updated' do
        let!(:guest) { create(:guest) }

        let(:invite_id) { guest.invite_code }

        context 'with required fields' do
          let(:input) do
            build(:guest).slice(:street, :town, :county, :postcode)
          end

          run_test!
        end

        context 'with all fields' do
          let(:input) do
            build(:guest).slice(
              :email, :street, :town, :county, :postcode, :country
            )
          end

          let!(:original_guest) { guest.attributes.with_indifferent_access }

          run_test!

          it 'updates the guest correctly' do
            expect(guest.reload.attributes).to eq(
              'id' => original_guest[:id],
              'name' => original_guest[:name],
              'priority' => original_guest[:priority],
              'tags' => original_guest[:tags],
              'allegiance' => original_guest[:allegiance],
              'invited_to' => original_guest[:invited_to],
              'email' => input[:email],
              'invite_code' => original_guest[:invite_code],
              'invite_link' => original_guest[:invite_link],
              'invite_sent' => original_guest[:invite_sent],
              'street' => input[:street],
              'town' => input[:town],
              'county' => input[:county],
              'postcode' => input[:postcode],
              'country' => input[:country],
              'count' => original_guest[:count]
            )
          end
        end
      end

      response '404', 'guest not found' do
        let!(:guest) { create(:guest) }
        let(:invite_id) { 1 }
        let(:input) { { yeah: 'nah' } }
        run_test!
      end

      response '422', 'invalid request' do
        let!(:guest) { create(:guest) }
        let(:invite_id) { guest.invite_code }
        let(:input) { { yeah: 'nah' } }
        run_test!
      end
    end
  end

  path '/api/guests' do
    post 'Create guest' do
      tags 'Guests'
      consumes 'application/json'
      parameter name: :input, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          street: { type: :string },
          town: { type: :string },
          county: { type: :string },
          postcode: { type: :string },
          country: { type: :string }
        },
        required: %w[name email street town county postcode]
      }

      response '201', 'guest created' do
        context 'with all fields' do
          let(:input) do
            build(:guest).slice(
              :email, :street, :town, :county, :postcode, :country
            )
          end

          run_test!

          it 'creates the guest correctly' do
            expect(Guest.first.attributes).to include(
              'name' => input[:name],
              'email' => input[:email],
              'street' => input[:street],
              'town' => input[:town],
              'county' => input[:county],
              'postcode' => input[:postcode],
              'country' => input[:country]
            )
          end
        end
      end

      response '422', 'invalid request' do
        let!(:guest) { create(:guest) }
        let(:input) { { yeah: 'nah' } }
        run_test!
      end

      response '423', 'locked' do
        let!(:guest) { create(:guest) }

        let(:input) do
          build(:guest).slice(
            :email, :street, :town, :county, :postcode, :country
          )
        end

        before do
          allow(Guest).to receive(:count).and_return(301)
        end

        run_test!
      end
    end
  end
end
