class SessionsController < ApplicationController
  def new
  	@title = "Sign in"
  end

  def create
  	user = User.authenticate(user_params[:email], user_params[:password])
  	if user.nil?
  		flash.now[:error] = "Invalid email/password combination."
  		render 'new'
  	else
  		flash[:success] = "Yes"
      sign_in user
  		#redirect_to user
      redirect_back_or user
  	end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private
  	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:session).permit(:email, :password)
    end
end
