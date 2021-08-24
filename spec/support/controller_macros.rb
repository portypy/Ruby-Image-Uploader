module ControllerMacros
  def login_admin
    user = FactoryBot.create(:admin)
    before(:each) do
      sign_in user
    end
  end
  def login_user
    user = FactoryBot.create(:user)
    before(:each) do
      sign_in user
    end
  end
end