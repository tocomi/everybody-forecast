Rails.application.routes.draw do
  devise_for :users
  root to: 'horse_race#index'
  get 'horse_race/race_list'
  get 'horse_race/horse_list'
  put 'horse_race/horse_list', to: 'horse_race#save_forecast'

  # logout
  devise_scope :user do
    get 'sign_out', to: "sessions#destroy"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
