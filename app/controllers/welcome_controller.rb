class WelcomeController < ApplicationController
  def index
    @reviews = Review.last(5)
  end
end
