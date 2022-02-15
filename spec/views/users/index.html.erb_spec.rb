require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: "MyText",
        password_digest: "MyText",
        session_token: "MyText"
      ),
      User.create!(
        name: "MyText",
        password_digest: "MyText",
        session_token: "MyText"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
