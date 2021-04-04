class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :set_q

    
    private
    
    def current_user
        current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def set_q
    @q = Room.ransack(params[:q])
    end
end
