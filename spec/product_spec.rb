(Dir['../code/*.rb']).each { |file| puts file ; require file }

describe Product do
  before(:each) do
    @inventory = ProductManager.new.inventory
  end

  it "should return FIXNUM_MAX for invalid input" do
    product = @inventory['MB11']
    product.optimal_cost_and_pack_combo(1)
    expect(product.best_priced_cost).to eq Product::FIXNUM_MAX
  end

  it "should return correct pricing for valid input" do
    product = @inventory['MB11']
    product.optimal_cost_and_pack_combo(14)
    expect(product.best_priced_cost).to eq (53.80)
  end
end
