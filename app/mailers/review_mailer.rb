class ReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_confirmation.receipt.subject
  #
  def new_review(review)
    @review = review
    
     mail(
      to: review.bourbon.user.email,
      subject: "Review Added"
     )
  end
end
 