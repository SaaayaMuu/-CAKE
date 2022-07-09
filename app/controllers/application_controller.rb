class ApplicationController < ActionController::Base
  
#before_action :authenticate_customer!, except: [:top, :about, :index,:show]
  
  

 # def autheniticate_admin
#    if @current_admin==nil
#      flash[:notice]="ログインが必要です"
#     redirect_to new_admin_session_path
#    end
#  end
  
end

