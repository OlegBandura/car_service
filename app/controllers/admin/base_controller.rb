module Admin
  # class base controller
  class BaseController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    # before_action :check_admin

    # protected
    #
    # def check_admin
    #   redirect_to root_path, alert: "Ви не маєте прав доступу до цієї сторінки" unless current_user.admin?
    # end
  end
end
