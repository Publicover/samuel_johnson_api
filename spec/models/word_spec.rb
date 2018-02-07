require 'rails_helper'

RSpec.describe Word, type: :model do
  it { should validate_presence_of(:name) }
end
