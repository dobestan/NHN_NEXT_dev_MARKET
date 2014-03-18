class WelcomeController < ApplicationController
  def home
    @items = Item.paginate(page: params[:page])
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
