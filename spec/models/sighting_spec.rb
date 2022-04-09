require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without a latitude' do
    bob = Sighting.create(longitude: 500, date: Date.today)
    expect(bob.errors[:latitude]).to_not be_empty
  end
  it 'is not valid without a longitude' do
    bob = Sighting.create(latitude: 100, date: Date.today)
    expect(bob.errors[:longitude]).to_not be_empty
  end
  it 'is not valid without a date' do
    bob = Sighting.create(latitude: 100, longitude: 500)
    expect(bob.errors[:date]).to_not be_empty
  end

  
end

