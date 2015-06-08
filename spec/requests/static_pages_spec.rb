require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit '/static_pages/home' }
  
    it "should have the content 'HomePage'" do
      expect(page).to have_content('ようこそ')
    end
    
    it "should have the right title" do
      expect(page).to have_title('HomePage')
    end
    
  end
  
  describe "About page" do
    before { visit '/static_pages/about' }
    
    it "should have the content 'About'" do
      expect(page).to have_content('About')
    end
    
    it "should have the right title" do
      expect(page).to have_title("About")
    end
    
  end
end