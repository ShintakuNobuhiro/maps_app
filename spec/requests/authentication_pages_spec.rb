require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "signin" do
    before { visit signin_path }
    
    describe "with invaild information" do
      before { click_button "サインイン" }
      
      it { should have_title('サインイン') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      
      describe "after visiting another page" do
        before {click_link "ホーム" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
    describe "with vaild information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "サインイン"
      end
      
      it { should have_title(user.name) }
      it { should have_link('プロフィール', href: user_path(user)) }
      it { should have_link('サインアウト', href: signout_path) }
      it { should_not have_link('サインイン', href: signin_path) }
      
    end
  end
  
  describe "authorization" do
    
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      
      describe "in the Users controller" do
        before do
          visit edit_user_path(user)
          fill_in "Email", with: user.email
          fill_in "Password", with: user.password
          click_button "サインイン"
        end
        
        describe "after signing in" do
          
          it "should render the disired protected page" do
            expect(page).to have_title('ユーザーの編集')
          end
        end
      end
        
      describe "visiting the edit page" do
        before { visit edit_user_path(user) }
        it { should have_title('サインイン') }
      end
      
      describe "submitting to the update action" do
        before { patch user_path(user) }
        specify { expect(response).to redirect_to(signin_path) }
      end
      
      describe "as non-admin user" do
        let(:user) { FactoryGirl.create(:user) }
        let(:non_admin) { FactoryGirl.create(:user) }
        
        before { sign_in non_admin, no_capybara: true }
        
        describe "submitting a DELETE request to the Users#destroy action" do
          before { delete user_path(user) }
          specify { expect(response).to redirect_to(root_path) }
        end
      end
    end
      
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user, no_capybara: true }
        
      describe "submitting a GET request t the Users#edit action" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match('Edit user') }
        specify { expect(response).to redirect_to(root_url) }
      end
      
      describe "submitting a PATCH request to the Users#update action" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_path) }
      end
    end
    
    describe "in the Records controller" do
        
      describe "submitting to the create action" do
        before { post records_path }
        specify { expect(response).to redirect_to(signin_path) }
      end
        
      describe "submitting to the destroy action" do
        before { delete record_path(FactoryGirl.create(:record)) }
        specify { expect(response).to redirect_to(signin_path) }
      end
    end
  end
end
