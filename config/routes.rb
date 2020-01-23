Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'phone_numbers', to: 'users/registrations#create_tel'
    post 'addresses', to: 'users/registrations#create_address'
    post 'mycards', to: 'users/registrations#create_card'
  end
  root "toppage#index"

  resources :signup,only:[:index]
  resources :mypages,only:[:index,:edit] do
    collection do
      get 'card'
      get 'signout'
      get 'identification'
      get 'edit'
    end
  end
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'
      get  'done'=>      'items#done', as: 'done'
      post 'pay'
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :cards, only:[:new, :create] do
    collection do
      post 'done', to: 'cards#create'
      get 'done'
    end
  end
end

