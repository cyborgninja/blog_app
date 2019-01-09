Rails.application.routes.draw do
  resources :blogs do
    resources :entries, :only => [:show, :new, :edit, :create, :destroy] do
      resources :comments, :only => [:new, :create, :destroy]
    end
  end
  patch 'blogs/:blog_id/entries/:entry_id/comments/:id', to: 'comments#approve', as: :comment_approve
end

