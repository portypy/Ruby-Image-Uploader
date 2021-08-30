require 'rails_helper'

RSpec.describe "subcategories/new", type: :view do
  before(:each) do
    assign(:subcategory, Subcategory.new())
  end

  it "renders new subcategory form" do
    render

    assert_select "form[action=?][method=?]", subcategories_path, "post" do
    end
  end
end
