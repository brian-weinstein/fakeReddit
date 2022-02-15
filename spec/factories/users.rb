# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :text             not null
#  password_digest :text             not null
#  session_token   :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    name { "MyText" }
    password_digest { "MyText" }
    session_token { "MyText" }
  end
end
