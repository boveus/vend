require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe "#methods" do
    scenario "it can compute an average cost of its snacks" do
      owner = Owner.create(name: "Sam's Snacks")
      machine  = owner.machines.create(location: "Don's Mixed Drinks")
      machine.snacks.create(name: 'Cheesey poofs', price: 5.00)
      machine.snacks.create(name: 'Cocoa poofs', price: 7.00)
      machine.snacks.create(name: 'Carrots', price: 2.00)

      expect(machine.average_snack_price.round(2)).to eq(4.67)
    end
    scenario "it can return a count of snacks it sells" do
      owner = Owner.create(name: "Sam's Snacks")
      machine  = owner.machines.create(location: "Don's Mixed Drinks")
      machine.snacks.create(name: 'Cheesey poofs', price: 5.00)
      machine.snacks.create(name: 'Cocoa poofs', price: 7.00)
      machine.snacks.create(name: 'Carrots', price: 2.00)

      expect(machine.total_items_count).to eq(3)
    end
  end
end
