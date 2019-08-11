Rails.application.routes.draw do
  scope 'api' do
    mount Rswag::Api::Engine => '/api-docs'
  
    get '/guests', to: 'guests#index'
  end
end
