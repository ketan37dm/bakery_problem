class ProductManager
  attr_accessor :inventory

  def initialize
    @inventory = {}
    [
      ['Vegemite Scroll', 'VS5', {3 => 6.99, 5 => 8.99} ],
      ['Blueberry Muffin', 'MB11', {2 => 9.95, 5 => 16.95, 8 => 24.95} ],
      ['Croissant', 'CF', {3 => 5.95, 5 => 9.95, 9 => 16.99}]
    ].each do |name, code, packs|
      @inventory[code] = Product.new(name, code, packs)
    end
  end
end
