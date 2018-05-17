Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # 設定前台路由
  root "posts#index"

  # 設定後台路由，運用 Namespace 這個方法
  namespace :admin do
  	root "posts#index"
  end

end
