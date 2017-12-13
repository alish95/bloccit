Rails.application.routes.draw do

    resources :advertisements, :questions

    resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
     end

     get 'about' => 'welcome#about'

     root 'welcome#index'
end
