class OrderManager
  INPUT_FILE = 'input.txt'

  def initialize
    @inventory = ProductManager.new.inventory
  end

  def execute
    File.readlines('./' + INPUT_FILE).each do |line|
      order_total, product_code = line.split(' ')
      serve_order(order_total.to_i, product_code)
    end
  end

  private

  def serve_order(order_total, product_code)
    product = @inventory[product_code]
    product.optimal_cost_and_pack_combo(order_total)
    puts product.inspect
  end
end
