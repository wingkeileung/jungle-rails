class ReviewsController < ApplicationController
before_action :require_login

  def create
  @product = Product.find(params[:product_id])
  review = @product.reviews.new(review_params)
  review.user_id = current_user.id

    if review.save
      redirect_to @product, notice: 'Success'
    else
      redirect_to @product, notice: 'Error, check your comments before submittion!'
    end

  end

def destroy
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.destroy!
    end
    redirect_to product_path(params[:product_id])
  end

  private

 def review_params
    params.require(:review).permit(
        :description,
        :rating,
        :product_id
    )
  end

  def require_login
    unless current_user
      redirect_to login_path
    end
  end
end