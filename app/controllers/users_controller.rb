class UsersController < ApplicationController

  before_action :find_user_products, only: :shop
  before_action :find_searched_user, only: :show

  #PROFILE
  def show
    head :not_found unless @user
    # render 'layouts/invalid_page', status: :not_found
  end

  def shop
  end

  private

  #strong params
  def user_params
    return params.require(:user).permit(
      :name,
      :nickname,
      :email,
      :image_url,
      :uid,
      :provider
    )
  end

  def find_searched_user
    @user = User.find_by(id: params[:id])
  end

  def find_user_products
    @user_products = @user.find_products
  end
end
