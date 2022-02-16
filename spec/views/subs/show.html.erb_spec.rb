require 'rails_helper'

RSpec.describe "subs/show", type: :view do
  before(:each) do
    @sub = assign(:sub, Sub.create!(
      title: "MyText",
      description: "MyText",
      moderator_id: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
