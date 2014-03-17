class UsersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'json'

  def show
    @user = User.find(params[:id])
    @user_infos = JSON.parse Nokogiri::HTML(open("http://graph.facebook.com/#{@user.uid}")).css("p").inner_html
  end

  def items
    @items = User.find(params[:id]).items
  end
end
