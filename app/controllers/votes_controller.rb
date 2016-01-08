class VotesController < ApplicationController
  before_action :pre_vote

  def upvote
    if @value.vote == 1
      @value.vote -= 1
    else
      @value.vote = 1
    end
    @value.save
    flash[:notice] = "Vote early, vote often"
    redirect_to bourbon_path(@review.bourbon)
  end

  def downvote
    if @value.vote == -1
      @value.vote += 1
    else
      @value.vote = -1
    end
    @value.save
    flash[:notice] = "Vote early, vote often"
    redirect_to bourbon_path(@review.bourbon)
  end

  protected

  def pre_vote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
