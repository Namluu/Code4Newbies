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
  		redirect_to user
  	end
  end

  def destroy
  end

  private
  	# Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:session).permit(:email, :password)
    end
end
