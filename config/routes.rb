StudentAdmin::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  root to: 'admin/dashboard#index'
  ActiveAdmin.routes(self)



end
