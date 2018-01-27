class Definition < ApplicationRecord
  belongs_to :word
  validates_presence_of :name
end
