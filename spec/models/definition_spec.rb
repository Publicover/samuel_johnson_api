require 'rails_helper'

RSpec.describe Definition, type: :model do
  it { should belong_to(:word) }
  it { should validate_presence_of(:name) }
end
