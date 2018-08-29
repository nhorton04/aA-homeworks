require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: 'Mario') }
  let(:cake) { Dessert.new("chocolate", 100000, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("chocolate")
    end
    it "sets a quantity" do
      expect(cake.quantity).to eq(100000)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("ice cream", "apples", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient('secret ingredient')
      expect(cake.ingredients).to include('secret ingredient')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['cake mix', 'milk', 'eggs', 'butter', 'frosting']

      ingredients.each {|ingredient| cake.add_ingredient(ingredient)}
      cake.mix!
      expect(cake.ingredients).not_to eq(ingredients)
      expect(cake.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(1)
      expect(cake.quantity).to eq(99999)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(100001) }.to raise_error("you can't eat that much")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Nicolai al Dente")
      expect(cake.serve).to eq("Chef Nicolai al Dente has made 100000 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef) to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
