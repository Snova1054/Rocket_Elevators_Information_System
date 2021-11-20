class DropboxController < ApplicationController
    # Example call:
    # GET /dropbox/auth
    def auth
      url = authenticator.authorize_url :redirect_uri => redirect_uri
  
      redirect_to url
    end
  
    # Example call:
    # GET /dropbox/auth_callback?code=VofXAX8DO1sAAAAAAAACUKBwkDZyMg1zKT0f_FNONeA
    def auth_callback
      auth_bearer = authenticator.get_token(params[:code],
                                            :redirect_uri => redirect_uri)
      token = auth_bearer.token # This line is step 5 in the diagram.
  
      # At this stage you may want to persist the reusable token we've acquired.
      # Remember that it's bound to the Dropbox account of your user.
  
      # If you persist this token, you can use it in subsequent requests or
      # background jobs to perform calls to Dropbox API such as the following.
      folders = DropboxApi::Client.new(token).list_folder "/"
    end
  
    private
  
    def authenticator
      client_id = ENV["dropbox_id"]
      client_secret = ENV["dropbox_secret"]
  
      DropboxApi::Authenticator.new(client_id, client_secret)
    end
  
    def redirect_uri
      dropbox_auth_callback_url # => http://localhost:3000/dropbox/auth_callback
    end
end