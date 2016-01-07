class WelcomeController < ApplicationController
  def index
    @bourbons = Bourbon.last(5)
    render :layout => "welcome"
  end
end
