require 'rails_helper'

RSpec.feature "CreateContacts", type: :feature do
  context "create a user" do
    Steps "for creating user" do
      Given "I'm on the index page" do
        visit '/'
        fill_in 'given_name', with: 'Bill'
        fill_in 'family_name', with: 'Nye'
        fill_in 'address', with: '674 Science Lane'
        fill_in 'email', with: 'the@scienceguy.com'
        click_button 'Submit'
      end
      Then "I see that Bill Nye is a person in my database" do
        expect(page).to have_content 'the@scienceguy.com'
      end
      Then "I can update Bill's contact info" do
        fill_in 'update_1', with: 'Nye'
        fill_in 'given_name_update', with: 'Sam'
        fill_in 'email_update', with: 'sam@notscience.com'
        click_button 'Update'
      end
      Then "Bill's info is updated to be Sam with email sam@notscience.com" do
      expect(page).to have_content 'sam@notscience.com'
      expect(page).to have_content 'Sam'
      end
      Then "I can delete the evil Bill-Sam!" do
        fill_in 'destroy_1', with: 'Nye'
        click_button 'Destroy!'
        expect(page).to_not have_content 'Sam'
      end
    end
  end
  context "Can not create a user without a first name and last name" do
    Steps "for not creating a user without a first and last name" do
      Given "I am on the index page" do
        visit '/'
        fill_in 'given_name', with: 'Chahls'
        click_button 'Submit'
        expect(page).to have_content 'You idiot, you need a last name'
      end
    end
  end





end
