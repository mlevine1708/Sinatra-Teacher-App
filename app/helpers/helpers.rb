helpers do

    def logged_in?(session)
      !!session[:user_id]
    end

    def current_user
      Users.find(session[:user_id])
    end
    
  end