class ReviewNotifier < ActionMailer::Base
  default from: "reviews@frqntflyr.herokuapp.com"

  def new_review(review)
    @review = review

    mail(
      to: review.airline.user.email,
      subject: "A new review for #{review.airline.name} has been submitted"
    )
  end
end
