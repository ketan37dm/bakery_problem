class Product
  FIXNUM_MAX = (2**(0.size * 8 -2) -1)
  attr_accessor :name, :code, :packs, :best_priced_cost, :best_priced_combo

  def initialize(name, code, packs)
    @name = name
    @code = code
    @packs = packs
    @best_priced_cost = FIXNUM_MAX
    @best_priced_combo = []
  end

  def optimal_cost_and_pack_combo(order_total, current_combo = [])
    current_sum = current_combo.inject(0, :+)
    current_cost = current_combo.map{ |value| @packs[value] }.inject(0, :+).round(2)
    if current_sum == order_total && current_cost < @best_priced_cost
      @best_priced_cost = current_cost
      @best_priced_combo = current_combo
    end

    return if current_sum > order_total

    (0..(@packs.keys.length - 1)).each do |i|
      optimal_cost_and_pack_combo(order_total, current_combo + [@packs.keys[i]])
    end
  end

  def best_priced_combo_hash
    combo_hash = {}
    best_priced_combo.each do |key|
      combo_hash.keys.include?(key) ? (combo_hash[key] += 1) : (combo_hash[key] = 1)
    end
    combo_hash
  end
end
