Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/reviews' => 'reviews#pullandshow' # pull data and display (to test API)
  get '/save_reviews' => 'reviews#save_reviews' # executed once to store to db
  get '/' => 'reviews#index' # displays reviews from database
end
