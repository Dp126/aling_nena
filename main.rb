require 'sinatra'
require './boot.rb'
require './money_calculator.rb'

# ROUTES FOR ADMIN SECTION
get '/admin' do
  @products = Item.all
  erb :admin_index
end

get '/new_product' do
  @product = Item.new
  erb :product_form
end

post '/create_product' do
	@item = Item.new
	@item.name = params[:name]
	@item.price = params[:price]
	@item.quantity = params[:quantity]
	@item.sold = 0
	@item.save
 	redirect to '/admin'
end

get '/edit_product/:id' do
  @product = Item.find(params[:id])
  erb :product_form
end

post '/update_product/:id' do
  @product = Item.find(params[:id])
  @product.update_attributes!(
    name: params[:name],
    price: params[:price],
    quantity: params[:quantity],
  )
  redirect to '/admin'
end

get '/delete_product/:id' do
  @product = Item.find(params[:id])
  @product.destroy!
  redirect to '/admin'
end
# ROUTES FOR ADMIN SECTION

# ROUTES FOR CLIENT SECTION
get '/' do
  @products = Item.all
  @random_product = @products.sample(10)
  erb :home2
end

get '/products' do
  @products = Item.all
  erb :products
end

get '/buy/:id' do
  id = params[:id]
  @product = Item.find(params[:id])
  erb :buy_form
end

post '/buy_product/:id' do
  @product = Item.find(params[:id])
  @quantity = params[:quantity].to_i
  @cost = @product.price.to_i
  @calcu = MoneyCalculator.new(params[:ones],params[:fives],params[:tens],params[:twenties],params[:fifties],params[:hundreds],params[:five_hundreds],params[:thousands])
  @change_bill = @calcu.change(@cost, @quantity)
  if (@calcu.total.to_i > (@cost * @quantity))
    erb :buy_results
  else
    erb :buy_failed
  end
end

get '/about' do
  erb :about
end

# ROUTES FOR CLIENT SECTION


