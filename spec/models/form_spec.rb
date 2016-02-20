require 'rails_helper'

describe Form do
  it "Generates a uuid on create" do
    form = Form.create(name: 'Test form')
    
    expect(form.uuid).to match /^[a-zA-Z0-9]*$/
    expect(form.uuid.length).to eq 10
  end
end