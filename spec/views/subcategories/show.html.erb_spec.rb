require 'rails_helper'

RSpec.describe "subcategories/show", type: :view do
  before(:each) do
    @subcategory = assign(:subcategory, FactoryBot.create(:subcategory))
  end

  it "renders attributes in <p>" do
    render
  end
end
