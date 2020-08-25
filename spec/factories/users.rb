FactoryBot.define do
  factory :user do
    last_name { 'てすと' }
    first_name { 'てすと' }
    last_name_reading { 'テスト' }
    first_name_reading { 'テスト' }
    birthday { 20.years.ago }
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
