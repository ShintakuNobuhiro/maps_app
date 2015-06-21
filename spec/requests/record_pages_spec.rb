require 'spec_helper'

describe "Record pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "record creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a record" do
        expect { click_button "送信" }.not_to change(Record, :count)
      end

      describe "error messages" do
        before { click_button "送信" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'record_content', with: "Lorem ipsum" }
      before { fill_in 'record_lat', with: "40.1" }
      before { fill_in 'record_lng', with: "40.1" }
      before { fill_in 'record_weather', with: "雨" }
      before { fill_in 'record_date', with: "7/1" }

      it "should create a record" do
        expect { click_button "送信" }.to change(Record, :count).by(1)
      end
    end
  end
end