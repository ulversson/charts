module Features
  module FeaturesHelpers
    
    def expect_to_see_link(text)
      expect(page).to have_link(text)
    end
  
  end
end  