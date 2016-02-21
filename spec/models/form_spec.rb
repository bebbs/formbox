require 'rails_helper'

describe Form do
  it "Generates a uuid on create" do
    form = Form.create(name: 'Test form')
    
    expect(form.uuid).to match /^[a-zA-Z0-9]*$/
    expect(form.uuid.length).to eq 10
  end
  
  it "Validates name" do
    no_name, too_short_name, valid_name = '', 'ab', 'abcdefg'
    
    expect(Form.create(name: no_name)).to be_invalid
    expect(Form.create(name: too_short_name)).to be_invalid
    expect(Form.create(name: valid_name)).to be_valid
  end
  
  context 'Status' do
    before(:each) do
      @form = Form.create(name: 'Test Form')
    end
    
    it "Published by default" do
      expect(@form).to be_published
    end
    
    it "Can be archived" do
      @form.archived!
      
      expect(@form).to be_archived
    end
    
    it 'Can be unarchived' do
      @form.archived!
      @form.published!
      
      expect(@form).not_to be_archived
      expect(@form).to be_published
    end
  end
end