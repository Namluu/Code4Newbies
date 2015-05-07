class PagesController < ApplicationController
  def about
  	@title = "About"
  end

  def contact
  end

  def greeting
  	render layout: "greeting"
  end
end
