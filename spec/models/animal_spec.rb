require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'should be invalid without a common name' do
    cheese = Animal.create(latin_name: 'filler', kingdom: 'filler')
    expect(cheese.errors[:common_name]).to_not be_empty
  end 
  it 'should be invalid without a common name' do
    cheese = Animal.create(common_name: 'filler', kingdom: 'filler')
    expect(cheese.errors[:latin_name]).to_not be_empty
  end 
  it 'should be invalid without a common name' do
    cheese = Animal.create(common_name: 'filler', latin_name: 'filler',)
    expect(cheese.errors[:kingdom]).to_not be_empty
  end 
  it 'should have unique common names' do
    Animal.create(common_name: 'filler', latin_name: 'filler', kingdom: 'filler')
    cheese = Animal.create(common_name: 'filler', latin_name: 'filler', kingdom: 'filler')
    expect(cheese.errors[:common_name]).to_not be_empty
  end 
  it 'should have unique latin names' do
    Animal.create(common_name: 'filler', latin_name: 'filler', kingdom: 'filler')
    cheese = Animal.create(common_name: 'filler', latin_name: 'filler', kingdom: 'filler')
    expect(cheese.errors[:latin_name]).to_not be_empty
  end 
end
