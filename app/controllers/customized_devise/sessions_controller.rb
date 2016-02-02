module CustomizedDevise
  class SessionsController < ::Devise::SessionsController
    before_action :check_status, only: :create

    private

    def check_status
      user = User.find_by(email: params[:user][:email])
      if user && user.status.eql?(false)
        flash[:alert] = 'Пользователь не активен'
        redirect_to root_path
      end
    end
  end
end