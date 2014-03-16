class ItemsController < ApplicationController
  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    @item.update_attributes(finish: 0)
    if @item.save
      redirect_to root_path
    else
      render text: "no"
    end
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :price, :deal)
    end
end
