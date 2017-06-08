require "rails_helper"
feature "User visits hompeage" do 
  scenario "successfully" do
    visit root_path
    expect(page).to have_css :h1, text: "Cryptocurrencies"
  end  
end  