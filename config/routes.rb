Rails.application.routes.draw do
  root to: 'horse_race#index'
  get 'horse_race/race_list'
  get 'horse_race/horse_list'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
