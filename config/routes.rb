Rails.application.routes.draw do
  namespace :api, format: :json do
    namespace :v1 do
      resources :links, only: %i(show create)
    end
  end
end
