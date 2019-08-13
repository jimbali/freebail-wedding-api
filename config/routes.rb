Rails.application.routes.draw do
  scope 'api' do
    mount Rswag::Api::Engine => '/api-docs'

    get '/guests', to: 'guests#index'

    get '/health', to: 'health#index'
  end
end
