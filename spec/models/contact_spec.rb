require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is a thing' do
    expect{Contact.new}.to_not raise_error
  end

  it "can create two contacts and then query them correctly" do
    contact = Contact.new
    contact.given_name = "Paul"
    contact.family_name = "Walker"
    contact.address = "123 Tyler Lane"
    contact.email = "pwalker@fast.com"
    expect(contact.save).to eq true
    contact_2 = Contact.new
    contact_2.given_name = "Dominic"
    contact_2.family_name = "Toretto"
    contact_2.address = "987 Somewhere Rd"
    contact_2.email = "dtoretto@fast.com"
    expect(contact_2.save).to eq true
    tester = Contact.find_by_given_name 'Paul'
    expect(tester.family_name).to eq 'Walker'
    expect(tester.email).to eq 'pwalker@fast.com'
  end




end
