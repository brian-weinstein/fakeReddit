require 'rails_helper'

RSpec.describe "subs/edit", type: :view do
  before(:each) do
    @sub = assign(:sub, Sub.create!(
      title: "MyText",
      description: "MyText",
      moderator_id: 1
    ))
  end

  it "renders the edit sub form" do
    render

    assert_select "form[action=?][method=?]", sub_path(@sub), "post" do

      assert_select "textarea[name=?]", "sub[title]"

      assert_select "textarea[name=?]", "sub[description]"

      assert_select "input[name=?]", "sub[moderator_id]"
    end
  end
end
