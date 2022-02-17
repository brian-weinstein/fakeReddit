require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      content: "MyText",
      author_id: 1,
      post_id: 1,
      parent_comment_id: 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "textarea[name=?]", "comment[content]"

      assert_select "input[name=?]", "comment[author_id]"

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "input[name=?]", "comment[parent_comment_id]"
    end
  end
end
