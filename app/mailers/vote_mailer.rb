class VoteMailer < ApplicationMailer
  def up_vote(review)
    @review = review
    mail(
      to: review.user.email,
      subject: "Vote Added"
    )
  end

  def down_vote(review)
    @review = review
    mail(
      to: review.user.email,
      subject: "Vote Added"
    )
  end
end