class ItemsController < ApplicationController
  def new
    @item = current_user.items.build
  end

  def create
    @items = current_user.items.build(item_params)
    @items.update_attributes(deal: 0, finish: 0)
    if @items.save
      render text: "okay"
    else
      render text: "no"
    end
  end

  private
    def item_params
      params.require(:item).permit(:title, :description, :price)
    end
end
