class Animal < ApplicationRecord
  has_many :sightings
  accepts_nested_attributes_for :sightings
  validates :common_name, :latin_name, :kingdom, presence: true, uniqueness: true

validate :validates, on: :create

  def validates(same)
    if same.common_name == same.latin_name
      same.errors.add :name, "422 Common and Latin name cannot be the same"
    end
  end 


end
