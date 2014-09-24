Rails.application.routes.draw do

  get '/register' => 'stats#register_user'
  get '/stats' => 'stats#send_stats'

end
