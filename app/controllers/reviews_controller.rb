class ReviewsController < ApplicationController
  def new
    @bourbon = Bourbon.find(params[:bourbon_id])
    @user = current_user
    @review = Review.new
  end

  def edit
    @bourbon = Bourbon.find(params[:bourbon_id])
    @user = current_user
    @review = Review.find(params[:id])
  end

  def create
    @bourbon = Bourbon.find(params[:bourbon_id])
    @user = current_user
    @review = @bourbon.reviews.new(review_params)
    @review.user = @user
    @vote_total = Vote.group(:review_id).sum(:vote)

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to bourbon_path(@bourbon)
    else
      flash.now[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def update
    @bourbon = Bourbon.find(params[:bourbon_id])
    @review = Review.find(params[:id])
    @review.update(review_params)

    if @review.save
      flash[:notice] = 'Review updated successfully'
      redirect_to bourbon_path(@review.bourbon)
    else
      flash.now[:error] = @review.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    bourbon = @review.bourbon
    @review.destroy

    redirect_to bourbon_path(bourbon), notice: "Review Wasted!"
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :user, :bourbon)
  end
end
