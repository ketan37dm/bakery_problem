(Dir['./code/*.rb']).each { |file| require file }
order_manager = OrderManager.new
order_manager.execute
