class OrderManager
  INPUT_FILE = 'input.txt'
  OUTPUT_FILE = 'output.txt'

  def execute
    File.readlines('./' + INPUT_FILE).each do |line|
      @inventory = ProductManager.new.inventory
      order_total, product_code = line.split(' ')
      serve_order(order_total.to_i, product_code)
    end
  end

  private

  def serve_order(order_total, product_code)
    product = @inventory[product_code]
    product.optimal_cost_and_pack_combo(order_total)
    write_to_output_file(product, order_total)
  end

  def write_to_output_file(product, order_total)
    File.open('./' + OUTPUT_FILE, "a") do |f|
      f.puts("#{order_total} #{product.code}")
      if product.best_priced_cost == Product::FIXNUM_MAX
        f.puts("\t Order Can not be Processed. Please look at the availbale Packs and chage your order")
      else
        product.best_priced_combo_hash.each do |availbale_pack, required_number|
          f.puts("\t #{required_number} X #{availbale_pack}  $#{product.packs[availbale_pack]}")
        end
      end
    end
  end
end
