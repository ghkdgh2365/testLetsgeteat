class HomeController < ApplicationController
  require 'csv'
  before_action :authenticate_user!, only: [ :review_write, :write, :registration, :board]
  def index
  end

  def random_result
    @walk = params[:walkbox]
    @food_category = params[:boxbox]
    @price= params[:pricebox]
    # 버전 1
    # if @walk == nil && @food_category == nil
    #   @stores = Store.all
    # else
    #   if @walk != nil && @food_category != nil
    #     @stores = Store.where(food_category: [@food_category], distance: [@walk])
    #   else
    #     if @walk == nil
    #       @stores = Store.where(food_category: [@food_category])
    #     else
    #       @stores = Store.where(distance: [@walk])
    #     end
    #   end
    # end
    #버전2
    if @walk == nil
      @walk = ['배달','5분','10분','15분']
    end
    if @food_category == nil
      @food_category = ['한식', '일식', '중식', '양식', '분식', '기타']
    end
    @price1 = 1
    @price2 = 2
    @price3 = 3
    if @price == nil
      @price = [@price1, @price2, @price3]
    end
    @stores = Store.where(food_category: [@food_category], distance: [@walk], price_feel: [@price])
    @store = @stores.sample(1)
    @store.each do |s|
      @store_id = s.id
    end
    @menus = Menu.all
    @reviews = Review.where(store_id: @store_id).all.order(created_at: :desc)
  end
  
  def review_write
    @review = Review.new
    @review.content = params[:content]
    @review.store_id = params[:store_id]
    @review.user = current_user
    @review.save
    
  end
  
  def search
    
  end
  
  def search_result
    @search_word = params[:search_word]
    
    @search_store_result= Store.where("store_name LIKE ? or keyword LIKE ?", "%#{@search_word}%", "%#{@search_word}%")

  end
  
  def search_condition
    @walk = params[:walkbox]
    @food_category = params[:boxbox]
    @price= params[:pricebox]
    if @walk == nil
      @walk = ['배달','5분','10분','15분']
    end
    if @food_category == nil
      @food_category = ['한식', '일식', '중식', '양식', '분식', '기타']
    end
    @price1 = 1
    @price2 = 2
    @price3 = 3
    if @price == nil
      @price = [@price1, @price2, @price3]
    end
    
    @stores = Store.where(food_category: [@food_category], distance: [@walk], price_feel: [@price])
    
    # 필요없는거
    #@search_condition = @stores.rand(food_category: ['한식','중식'])
    #@condition_result = Store.where(food_category: ['한식','중식'])
    #@condition = params[:check_search]
    #@condition_result = Store.where("food_category LIKE ?", "%#{@condition}%") 
    
  end  
  
  def contact
  end
  
  def write
    post = Ask.new
    post.title = params[:title]
    post.content = params[:content]
    post.ask_category_cd = params[:ask_category]
    post.tel_number = params[:tel_number]
    post.user = current_user
    
    if post.save
      flash[:notice] = '성공적으로 전송되었습니다.'
    end
    redirect_to :back
    
  end
  
  def introduction
  end
  
  def registration
  end
  
  def board
    @post = Ask.new
    authorize_action_for @post
    @posts = Ask.all
    @stores = Store.all
    @menus = Menu.all
    @users = User.all
    @reviews = Review.all
  end
  
  def ask_show
    @one_post = Ask.find(params[:post_id])
  end
  
  def search_result_store
    @one_result = Store.find(params[:ssr_id])
    
    @store_id = @one_result.id
    @menus = Menu.all
    @reviews = Review.where(store_id: @store_id).all.order(created_at: :desc)
    
    
  end 
  
  def input_db
    @post = Ask.new
    authorize_action_for @post
    CSV.foreach('bob_database.csv', :headers => true , :encoding => 'euc-kr') do |row|
      Store.create!(row.to_hash)
    end
      # csv_text = File.open('bob_database.csv', "r:ISO-8859-1")
      # csv = CSV.parse(csv_text, :headers => true)
      # csv.each do |row|
      #   Store.create!(row.to_hash)
      # end
    @stores = Store.all
    CSV.foreach('bob_menu.csv', :headers => true , :encoding => 'euc-kr') do |row|
      Menu.create!(row.to_hash)
    end
    
    @menus = Menu.all
  end
  
end
