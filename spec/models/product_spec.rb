require 'rails_helper'

describe Product do
  it { is_expected.to validate_presence_of(:name) }
  it do
    should validate_numericality_of(:price).is_greater_than(0)
  end
  it { should belong_to(:cart) }
end
