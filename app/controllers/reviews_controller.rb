class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]

    @review = @product.reviews.new(review_params)

    # Add the user_id or it will fail
    @review.user_id = current_user.id

    if @review.save
      redirect_to @product, notice: 'Review was successfully created.'
    else
      redirect_to @product, notice: "Review couldn't be saved. #{@review.errors.full_messages}"
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
  end

  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description
    )
  end

end
