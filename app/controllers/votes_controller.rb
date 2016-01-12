# class VotesController < ApplicationController
#   before_action :authenticate_user!
#   before_action :pre_vote
#
#   def show
#     redirect_to bourbon_path(@review.bourbon)
#   end
#
#   def upvote
#     @value.vote == 1 ? @value.vote -= 1 : @value.vote = 1
#     respond_to do |format|
#       @value.save
#       @total_votes = Vote.group(:review_id).sum(:vote)
#       format.json { render json: @total_votes[@review.id] }
#     end
#   end
#
#   def downvote
#     @value.vote == -1 ? @value.vote += 1 : @value.vote = -1
#     respond_to do |format|
#       @value.save
#       @total_votes = Vote.group(:review_id).sum(:vote)
#       format.json { render json: @total_votes[@review.id] }
#     end
#   end
#
#   protected
#
#   def pre_vote
#     @review = Review.find(params[:review_id])
#     @value = Vote.find_or_initialize_by(review: @review, user: current_user)
#   end
# end


class VotesController < ApplicationController
  before_action :before


    def upvote
      if @value.vote == 0 || @value.vote == -1
        @value.vote = 1
        @value.save
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
