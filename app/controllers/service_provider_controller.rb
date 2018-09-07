class ServiceProviderController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    raise NotImplementedError
  end

  def metadata
    raise NotImplementedError
  end
end
