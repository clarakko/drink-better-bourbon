class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :pre_vote

  def upvote
    if @value.vote == 0 || @value.vote == -1
      @value.vote = 1

      respond_to do |format|
        @value.save
        flash[:notice] = "Upvoted!"
        @total_votes = Vote.group(:review_id).sum(:vote)
        format.json { render json: @total_votes[@review.id] }
      end
    elsif @value.vote == 1
      @value.vote -= 1
      respond_to do |format|
        @value.save
        flash[:notice] = "Upvote cancelled!"
        @total_votes = Vote.group(:review_id).sum(:vote)
        format.json { render json: @total_votes[@review.id] }
      end
    end
  end

  def downvote
    if @value.vote == 0 || @value.vote == 1
      @value.vote = -1
      respond_to do |format|
        @value.save
        flash[:notice] = "Downvoted!"
        @total_votes = Vote.group(:review_id).sum(:vote)
        format.json { render json: @total_votes[@review.id] }
      end
    elsif @value.vote == -1
      @value.vote += 1
      respond_to do |format|
        @value.save
        flash[:notice] = "Downvote cancelled!"
        @total_votes = Vote.group(:review_id).sum(:vote)
        format.json { render json: @total_votes[@review.id] }
      end
    end
  end

  protected

  def pre_vote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
  end
end
