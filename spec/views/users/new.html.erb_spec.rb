require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      name: "MyText",
      password_digest: "MyText",
      session_token: "MyText"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "textarea[name=?]", "user[name]"

      assert_select "textarea[name=?]", "user[password_digest]"

      assert_select "textarea[name=?]", "user[session_token]"
    end
  end
end
