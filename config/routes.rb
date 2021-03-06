Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/shelters/:shelter_id/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/shelters/:shelter_id/pets/new', to: 'pets#new'
  post '/shelters/:shelter_id/pets', to: 'pets#create'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/reviews', to: 'reviews#index'
  get '/shelters/:shelter_id/reviews/new', to: 'reviews#new'
  post '/shelters/:shelter_id/reviews', to: 'reviews#create'
  get '/shelters/:shelter_id/reviews/:id/edit', to: 'reviews#edit'
  patch '/shelters/:shelter_id/reviews/:id', to: 'reviews#update'
  delete '/shelters/:shelter_id/reviews/:id', to: 'reviews#destroy'

  patch '/favorites/:pet_id', to: 'favorites#update'
  get '/favorites', to: 'favorites#index'
  delete '/favorites/:pet_id', to: 'favorites#destroy'
  delete '/favorites', to: "favorites#destroy_all"

  get 'adoptions/new', to: 'adoptions#new'
  post '/adoptions/', to: 'adoptions#create'
  get '/adoptions/:id', to: 'adoptions#show'

  get '/pets/:id/adoptions', to: 'adoptions#index'

  patch '/adoptions/:adoptions_id/pets/:pet_id', to: 'pet_adoptions#update'
  delete '/adoptions/:adoptions_id/pets/:pet_id', to: 'pet_adoptions#revoke'
end
