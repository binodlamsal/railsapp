Rails.application.routes.draw do
  resources :dashborad

  root '_dashboard#index'



  resources :services
  resources :testimonials

end
