Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/reviews' => 'reviews#pullandshow'
  get '/save_reviews' => 'reviews#save_reviews'
  get '/' => 'reviews#index'
end
