# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :text             not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :sub do
    title { "MyText" }
    description { "MyText" }
    moderator_id { 1 }
  end
end
