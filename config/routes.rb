# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api' do
    mount Rswag::Api::Engine => '/api-docs'

    get '/guests/:invite_id', to: 'guests#show'

    get '/health', to: 'health#index'
  end
end
