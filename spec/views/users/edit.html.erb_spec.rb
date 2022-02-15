require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "MyText",
      password_digest: "MyText",
      session_token: "MyText"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "textarea[name=?]", "user[name]"

      assert_select "textarea[name=?]", "user[password_digest]"

      assert_select "textarea[name=?]", "user[session_token]"
    end
  end
end
