class IdentityProviderController < SamlIdp::IdpController
  def idp_authenticate(email, password) # not using params intentionally
    OpenStruct.new(email: 'joe@schmoe.com')
  end
  private :idp_authenticate

  def idp_make_saml_response(found_user) # not using params intentionally
    encode_response found_user, encryption: {
        cert: saml_request.service_provider.cert,
        # block_encryption: 'aes256-cbc',
        key_transport: 'rsa-oaep-mgf1p'
    }
  end
  private :idp_make_saml_response

  def idp_logout
    # TODO probably not needed
  end
  private :idp_logout
end
