class Word < ApplicationRecord
  has_many :definitions, dependent: :destroy
  validates_presence_of :name
end
