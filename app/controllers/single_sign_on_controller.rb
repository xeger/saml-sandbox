class SingleSignOnController < ApplicationController
  include SamlIdp::Controller

  def new
    opts = {
      acs_url: 'http://localhost/saml/sp/acs',
      audience_uri: 'http://localhost/saml/sp/metadata',
      expiry: 60*60,
      session_expiry: 8*60*60,
    }

    @user = User::TEST_FIXTURE
    @saml_response = encode_authn_response(@user, opts)
    @saml_relay_state = 'http://google.com?q=saml+2.0'
  end
end
