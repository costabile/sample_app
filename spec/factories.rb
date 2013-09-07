FactoryGirl.define do
  factory :user do
    name     "Jason Costabile"
    email    "jcostabile@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end