Rails.application.routes.draw do

  root 'sessions#register'
  delete 'sessions' => 'sessions#logout'


  get 'register' => 'sessions#register'
  get 'login' => 'sessions#login'

  post 'register_lender' => 'sessions#create_lender'
  post 'register_borrower' => 'sessions#create_borrower'

  post 'login' => 'sessions#login_user'



  get 'lender/:id' => 'lenders#show'
  get 'borrower/:id' => 'borrowers#show'


  post 'lend' => 'logs#create'

  #
  #
  # get 'sessions/new'
  #
  # get 'sessions/login'

end
