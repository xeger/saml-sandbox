Rails.application.routes.draw do
  get '/' => 'single_sign_on#new'

  post '/saml/sp/acs' => 'service_provider#create'

  get '/saml/idp/auth' => 'identity_provider#new'
  get '/saml/idp/metadata' => 'identity_provider#show'
  post '/saml/idp/auth' => 'identity_provider#create'
  match '/saml/idp/logout' => 'identity_provider#logout', via: [:get, :post, :delete]
end
