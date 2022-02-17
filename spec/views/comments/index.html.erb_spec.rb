require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        content: "MyText",
        author_id: 2,
        post_id: 3,
        parent_comment_id: 4
      ),
      Comment.create!(
        content: "MyText",
        author_id: 2,
        post_id: 3,
        parent_comment_id: 4
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
