class Api::V1::VotesController < ActionController::Base

  def upvote
    review = Review.find(params[:review][:id])
    value = Vote.find_or_initialize_by(review: review, user: current_user)
    (value.vote == 0 || value.vote == -1) ? value.vote = 1 : value.vote -= 1
    value.save
    total_votes = Vote.group(:review_id).sum(:vote)
    # respond_to do |format|
    #   format.json { render json: total_votes[review.id] }
    # end
    # render json: total_votes[review.id], status: :updated, location: bourbon_path(review.bourbon)
    render json: total_votes[review.id]
  end

  def downvote
    review = Review.find(params[:review][:id])
    value = Vote.find_or_initialize_by(review: review, user: current_user)
    (value.vote == 0 || value.vote == 1) ? value.vote = -1 : value.vote += 1
    value.save
    total_votes = Vote.group(:review_id).sum(:vote)
    render json: total_votes[review.id]
  end

  private

  def vote_params
    params.require(:vote).permit(:user, :review)
  end
end
