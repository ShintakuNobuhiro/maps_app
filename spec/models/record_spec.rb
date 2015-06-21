require 'spec_helper'

describe Record do

  let(:user) { FactoryGirl.create(:user) }
  before { @record = Record.new(content: "Lorem ipsum", user_id: user.id, lat:40.1, lng:120.5, weather:"雨", date: "2015-07-01 10:00") }

  subject { @record }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:lat) }
  it { should respond_to(:lng) }
  it { should respond_to(:weather) }
  it { should respond_to(:date) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  

  it { should be_valid }

  describe "when user_id is not present" do
    before { @record.user_id = nil }
    it { should_not be_valid }
  end
end