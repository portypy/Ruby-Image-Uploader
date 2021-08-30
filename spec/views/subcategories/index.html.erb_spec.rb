require 'rails_helper'

RSpec.describe "subcategories/index", type: :view do
  before(:each) do
    assign(:subcategories, [
      FactoryBot.create(:category),
      FactoryBot.create(:category)
    ])
  end

  it "renders a list of subcategories" do
    # render categories_path
  end
end
