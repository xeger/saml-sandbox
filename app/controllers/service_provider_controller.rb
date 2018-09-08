require 'onelogin/ruby-saml'

class ServiceProviderController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create    
    @saml_response = OneLogin::RubySaml::Response.new(params[:SAMLResponse], settings: saml_settings)

    dupe = OneLogin::RubySaml::Response.new(params[:SAMLResponse], settings: saml_settings)
    begin
      dupe.soft = false
      dupe.is_valid?
    rescue => e
      @saml_exception = e
    end    
  end

  def metadata
    raise NotImplementedError
  end

  private
  
  def saml_settings
    settings = OneLogin::RubySaml::Settings.new
  
    settings.assertion_consumer_service_binding = "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
    settings.assertion_consumer_service_url     = "http://#{request.host}/saml/sp/acs"
    settings.issuer                             = "http://#{request.host}/saml/sp/metadata"
    settings.idp_entity_id                      = "http://#{request.host}/saml/idp/metadata"
    settings.idp_sso_target_url                 = "http://#{request.host}/saml/idp/auth"
    settings.idp_cert                           = File.read('tmp/saml-idp-certificate.pem')
    settings.name_identifier_format             = "urn:oasis:names:tc:SAML:1.1:nameid-format:persistent"

    settings.authn_context = [
      "urn:oasis:names:tc:SAML:2.0:ac:classes:PasswordProtectedTransport",
      "urn:oasis:names:tc:SAML:2.0:ac:classes:Password"
    ]
  
    settings
  end  
end
