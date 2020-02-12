require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_css 'article.product', count: 10
  end

  scenario "They click on the Details button" do
    #ACT
    visit root_path
    page.first('article.product').hover
    page.first('.btn-default').click
    
    #VERIFY
    expect(page).to have_link('Apparel')
    
    #DEBUG/VERIFY
    save_screenshot
  end
end
