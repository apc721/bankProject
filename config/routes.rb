Rails.application.routes.draw do
  root 'bank_project#index'
  get 'bank_project' => 'bank_project#index'
  get '/' => 'bank_project#index'
  post '/' => 'bank_project#handlePost'
end
