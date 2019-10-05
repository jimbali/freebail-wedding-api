# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api' do
    mount Rswag::Api::Engine => '/api-docs'
    mount Rswag::Ui::Engine => '/api-docs'

    get '/guests/:invite_id', to: 'guests#show'
    patch '/guests/:invite_id', to: 'guests#update'
    post '/guests', to: 'guests#create'

    get '/health', to: 'health#index'

    get '/ip', to: 'ip#index'
  end
end
