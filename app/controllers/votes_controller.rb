class VotesController < ApplicationController
  before_action :before

  def upvote
    if @value.vote == 0 || @value.vote == -1
      @value.vote = 1
      @value.save
      VoteMailer.up_vote(@review).deliver_later
      flash[:notice] = "Upvoted!"
    elsif @value.vote == 1
      @value.vote -= 1
      @value.save
      flash[:notice] = "Upvote cancelled!"
    end
    redirect_to bourbon_path(@review.bourbon)
  end

  def downvote
    if @value.vote == 0 || @value.vote == 1
      @value.vote = -1
      @value.save
      VoteMailer.down_vote(@review).deliver_later
      flash[:notice] = "Downvoted!"
    elsif @value.vote == -1
      @value.vote += 1
      @value.save
      flash[:notice] = "Downvote cancelled!"
    end
    redirect_to bourbon_path(@review.bourbon)
  end

  protected

  def before
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
