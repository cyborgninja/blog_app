Rails.application.routes.draw do
  resources :blogs do
    resources :entries, :only => [:show, :new, :edit, :create, :destroy] do
      resources :comments, :only => [:new, :create, :destroy]
    end
  end
end

