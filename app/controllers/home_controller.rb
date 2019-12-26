class HomeController < ApplicationController
  def index
  end

  def new
  	@items = Availability.all
  end

  def create
  	@count = Availability.find(params['item_name'][:item_name])
  	@count.count = params['availables'][:count]
  	if @count.save
  		redirect_to :action => 'index'
  	else
  		render :action => 'new'
  	end
  end

  def order_item
  	@success = []
  	@check_item = check_item(params[:order_item])
  	@check_item.each_pair { |key, val|
  		@available = Availability.find_by_item_name(key)
  		if @available.count >= val
  			minus_count = @available.count - val
  			@available.count = minus_count
  			@available.save
  			@success.push(1)
  		else
  			@success.push(0)
  		end
  	}
  	respond_to do |format|
      format.html { }
      format.json { render json: @success }
    end
  end

  def check_item(item)
  	if item == 'black_coffee'
  		items = {'water': 3, 'coffee': 1, 'sugar': 1, 'milk': 0}
  	elsif item == 'milk_coffee'
  		items = {'water': 1, 'coffee': 1, 'sugar': 1, 'milk': 2}
  	elsif item == 'black_coffee_sugar'
  		items = {'water': 3, 'coffee': 1, 'sugar': 0, 'milk': 0}
  	elsif item == 'milk_coffee_sugar'
  		items = {'water': 1, 'coffee': 1, 'sugar': 0, 'milk': 2}
  	end

  	return items
	end
end