class IdentityProviderController < SamlIdp::IdpController
  def idp_authenticate(email, password)
    User::TEST_FIXTURE
  end
  private :idp_authenticate

  def idp_make_saml_response(found_user)
    encode_response found_user, encryption: {
        cert: saml_request.service_provider.cert,
        # block_encryption: 'aes256-cbc',
        key_transport: 'rsa-oaep-mgf1p'
    }
  end
  private :idp_make_saml_response

  def idp_logout
    #
  end
  private :idp_logout
end
