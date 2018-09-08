SamlIdp.configure do |config|
  # Fluffy metadata
  config.organization_name = "SAML Sandbox"
  config.organization_url = "http://localhost:3000"

  # Base response information
  base = "http://localhost/saml/idp"
  config.base_saml_location = "#{base}/metadata" # aka "Entity ID we send in responses"
  config.attribute_service_location = "#{base}/attributes"
  config.single_service_post_location = "#{base}/auth"
  config.session_expiry = 86400

  # Metadata about attributes and their formats
  config.name_id.formats = {
    persistent: -> (user) { user.id },
    email_address: -> (user) { user.email },
    transient: -> (user) { "#{user.id}.#{Time.now.to_i % 100_000}" },
  }
  config.attributes = {}

  # Crypto gunk
  config.x509_certificate = File.read(Rails.root + 'tmp/saml-idp-certificate.pem')
  config.secret_key = File.read(Rails.root + 'tmp/saml-idp-key.pem')
end
