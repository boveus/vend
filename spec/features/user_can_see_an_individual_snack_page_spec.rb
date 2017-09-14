require 'rails_helper'

feature 'When a user visits a snack show page' do
  scenario 'they see some stuff' do
    owner = Owner.create(name: "Sam's Snacks")
    owner2 = Owner.create(name: "Sal's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    sals =  owner2.machines.create(location: "Sal's Artisan Cheetos")
    snack1 = sals.snacks.create(name: "Cheetos", price: 5.00)
    sals.snacks.create(name: "Hot Cheetos", price: 8.00)
    sals.snacks.create(name: "Flaming hot Cheetos", price: 3.00)
    dons.snacks << snack1

    visit snack_path(snack1)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content("$5.00")
    expect(page).to have_content(dons.location)
    expect(page).to have_content(sals.location)
    expect(page).to have_content("average price: $5.33")
    expect(page).to have_content("average price: $5.00")
    expect(page).to have_content("total items: 3")
    expect(page).to have_content("total items: 1")
  end
end
