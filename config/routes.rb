Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get '/home/turbo_frame_test' => 'home#turbo_frame_test', as: 'turbo_frame_test'
end
