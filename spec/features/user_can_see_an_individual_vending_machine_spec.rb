require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  scenario 'they see a list of all of the snacks associated with that vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Cheetos", price: 5.00)

    visit machine_path(dons)

    expect(page).to have_content("Snack name: Cheetos")
    expect(page).to have_content("Snack price: $5.00")
  end
  scenario "they see an average price for snacks" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create(name: "Cheetos", price: 5.00)
    dons.snacks.create(name: "Hot Cheetos", price: 8.00)
    dons.snacks.create(name: "Flaming hot Cheetos", price: 3.00)

    visit machine_path(dons)

    expect(page).to have_content("Average Snack price: $5.33")
  end
end
