class WelcomeController < ApplicationController
  def home
    @items = Item.paginate(page: params[:page])
    @finish_0 = Item.where(finish: 0).count
    @finish_1 = Item.where(finish: 1).count
    @deal_0 = Item.where(deal: 0).count
    @deal_1 = Item.where(deal: 1).count
    @deal_2 = Item.where(deal: 2).count
  end

  def sell
    @items = Item.where(deal: 0).paginate(page: params[:page])
  end

  def buy
    @items = Item.where(deal: 1).paginate(page: params[:page])
  end

  def share
    @items = Item.where(deal: 2).paginate(page: params[:page])
  end
end
