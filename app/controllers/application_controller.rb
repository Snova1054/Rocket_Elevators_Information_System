class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true

    def require_admin
        # depending on your auth, something like...
        redirect_to main_app.root_path unless current_user && current_user.admin? || current_user.employee?
    end

end
