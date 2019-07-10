Rails.application.routes.draw do
  root to: "home#top"
  get "about" => "home#about"
  get "note" => "note#index"

  namespace :api, format: 'json' do
    resources :notes, only: [:index, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
