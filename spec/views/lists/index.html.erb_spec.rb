require 'rails_helper'

RSpec.describe "lists/index", type: :view do
  before(:each) do
    assign(:lists, [
      List.create!(
        :description => "Description",
        :completed => false
      ),
      List.create!(
        :description => "Description",
        :completed => false
      )
    ])
  end

  it "renders a list of lists" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
