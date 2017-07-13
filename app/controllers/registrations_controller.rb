class RegistrationsController < Devise::RegistrationsController


  private

  def sign_up_params
    params.require(:user).permit(:nameUsers,:email, :password, :birthDate, :sex)
  end
  
  
  def account_update_params
    params.require(:user).permit(:nameUsers, :email, :password, :password_confirmation, :current_password, :aboutYou)
  end
  
end
