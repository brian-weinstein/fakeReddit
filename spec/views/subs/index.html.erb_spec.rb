require 'rails_helper'

RSpec.describe "subs/index", type: :view do
  before(:each) do
    assign(:subs, [
      Sub.create!(
        title: "MyText",
        description: "MyText",
        moderator_id: 2
      ),
      Sub.create!(
        title: "MyText",
        description: "MyText",
        moderator_id: 2
      )
    ])
  end

  it "renders a list of subs" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
