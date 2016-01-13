class ReviewMailer < ApplicationMailer

  def new_review(review)
    @review = review
     mail(
      to: review.bourbon.user.email,
      subject: "Review Added"
     )
  end
end
