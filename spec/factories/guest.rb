# frozen_string_literal: true

FactoryBot.define do
  factory :guest do
    name { Faker::TvShows::Simpsons.character }
    priority { Faker::Number.number(digits: 1) }
    tags { 'family' }
    allegiance { %w[bride groom].sample }
    invited_to { %w[ceremony reception all].sample }
    email { Faker::Internet.email }
    invite_code { Faker::Alphanumeric.alphanumeric(number: 10) }
    invite_link { "https://freebail.wedding/save-the-date/#{invite_code}" }
    invite_sent { Time.now.utc.iso8601 }
    street { Faker::TvShows::Simpsons.location }
    town { Faker::TvShows::Simpsons.location.truncate(25) }
    county { Faker::TvShows::Simpsons.location.truncate(25) }
    postcode { Faker::TvShows::Simpsons.location.truncate(10) }
    country { Faker::TvShows::Simpsons.location.truncate(25) }
    count { Faker::Number.number(digits: 1) }
  end
end
