require "rails_helper"
feature "user sees chart buttons" do 
  scenario "successfully" do
    visit root_path
    expect_to_see_link "BITCOIN"
    expect_to_see_link "ETHEREUM"
    expect_to_see_link "NASDAQ"
  end  
end  