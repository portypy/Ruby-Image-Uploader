require 'rails_helper'

RSpec.describe "subcategories/edit", type: :view do
  before(:each) do
    @subcategory = assign(:subcategory, FactoryBot.create(:subcategory))
  end

  it "renders the edit subcategory form" do
    render

    assert_select "form[action=?][method=?]", subcategory_path(@subcategory), "post" do
    end
  end
end
