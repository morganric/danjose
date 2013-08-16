class ApplicationController < ActionController::Base
 # include SessionsHelper
  protect_from_forgery
 

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


 # # Customize the Devise after_sign_in_path_for() for redirecct to previous page after login
 #  def after_sign_in_path_for(resource_or_scope)
 #    case resource_or_scope
 #    when :user, User
 #      store_location = session[:return_to]
 #      clear_stored_location	
 #      (store_location.nil?) ? "/" : store_location.to_s
 #    else
 #      super
 #    end
 #  end

 #  def after_sign_out_path_for(resource_or_scope)
 # 	url_for :controller => '/home', :action => 'goodbye'
 #  end

end
