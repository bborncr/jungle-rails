class ReviewsController < ApplicationController

  def create
    p = Product.find params[:product_id]

    review_data = review_params
    @review = p.reviews.new(review_data.merge({
      user: current_user
    }))
    if @review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description,
      :user_id,
      :product_id
    )
  end

end
