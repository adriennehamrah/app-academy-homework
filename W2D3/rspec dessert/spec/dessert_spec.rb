require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Adrienne") }
  subject(:cheesecake) { Dessert.new("cheesecake", 1000, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cheesecake.type).to eq("cheesecake")
    end

    it "sets a quantity" do
      expect(cheesecake.quantity).to eq(1000)
    end

    it "starts ingredients as an empty array" do
      expect(cheesecake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cookies", "ten", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cheesecake.add_ingredient("eggs")
      expect(cheesecake.ingredients).to include("eggs")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["cream cheese", "eggs", "vanilla"]
      ingredients.each { |el| cheesecake.add_ingredient(el) }
      cheesecake.mix!
      expect(cheesecake.ingredients).not_to eq(ingredients)
      expect(cheesecake.ingredients.sort).to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cheesecake.eat(400)
      expect(cheesecake.quantity).to eq(600)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cheesecake.eat(2000) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Adrienne the Baker")
      expect(cheesecake.serve).to eq("Adrienne the Baker has made 1000 cheesecakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(cheesecake)
      cheesecake.make_more
    end
  end
end
