Rails.application.routes.draw do   

  get 'contact' => 'contacts#index'

  post 'contact/confirm' => 'contacts#confirm'

  post 'contact/thanks' => 'contacts#thanks'

  root to: "home#top"
  get "about" => "home#about"
  get "note" => "note#index"

  namespace :api, format: 'json' do
    resources :notes, only: [:index, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
