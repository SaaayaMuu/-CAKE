# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  

  def after_sign_in_path_for(resource)
    customers_my_page_path(resource)
  end
  
  def after_sign_out_path_for(resource)
    new_customer_session_path
  end 
  
end
