class WelcomeController < ApplicationController
  def home
    @items = Item.all
  end
end
