Rails.application.routes.draw do

  get '/register' => 'stats#register_user'
  post '/pair' => 'stats#pair'
  get '/stats' => 'stats#send_stats'
  post '/selfie' => 'stats#selfie_upload'

end
