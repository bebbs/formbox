FactoryGirl.define do
  factory :form do
    name "Contact form"
    redirect_url "https://google.com"
    webhook_url ""
    user
  end
end