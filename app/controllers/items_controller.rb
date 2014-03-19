class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :delete]
  before_action :correct_user, only: [:edit, :update, :delete]

  def new
    @item = current_user.items.build
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = current_user.items.build(item_params)
    @item.update_attributes(finish: 0)
    if @item.save
      flash[:success] = "물품이 정상적으로 등록되었습니다."
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "물품 정보가 정상적으로 수정되었습니다."
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :price, :deal, :main_image)
    end
end
