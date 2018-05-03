class SessionsController < ApplicationController

  # Is this necessary for the project?? No, I think
  def create
    auth_hash = request.env['omniauth.auth']
    raise
  end

end
