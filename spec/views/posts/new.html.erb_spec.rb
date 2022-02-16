require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      title: "MyString",
      url: "MyString",
      content: "MyText",
      sub_id: 1,
      author_id: 1
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[title]"

      assert_select "input[name=?]", "post[url]"

      assert_select "textarea[name=?]", "post[content]"

      assert_select "input[name=?]", "post[sub_id]"

      assert_select "input[name=?]", "post[author_id]"
    end
  end
end
