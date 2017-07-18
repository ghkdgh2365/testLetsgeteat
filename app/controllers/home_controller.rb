class HomeController < ApplicationController
  require 'csv'
  # before_action :authenticate_user!, except: [ :index ]
  def index
  end

  def random_result
    @stores = Store.all
    @store = @stores.sample(1)
  end

  def search
  end
  
  def contact
  end
  
  def write
    post = Ask.new
    post.title = params[:title]
    post.content = params[:content]
    post.ask_category_cd = params[:ask_category]
    post.user = current_user
    post.save
    
    redirect_to '/home/board' 
  end
  
  def introduction
  end
  
  def registration
  end
  
  def board
     @post = Ask.all
  end
  
  def ask_show
    @one_post = Ask.find(params[:post_id])
  end
  
  def input_db
    CSV.foreach('bob_database.csv', :headers => true , :encoding => 'euc-kr') do |row|
      Store.create!(row.to_hash)
    end
      # csv_text = File.open('bob_database.csv', "r:ISO-8859-1")
      # csv = CSV.parse(csv_text, :headers => true)
      # csv.each do |row|
      #   Store.create!(row.to_hash)
      # end
    @stores = Store.all
  end
end
