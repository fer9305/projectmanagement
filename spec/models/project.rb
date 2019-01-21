require 'rails_helper'

RSpec.describe Project, type: :model do
  it {should accept_nested_attributes_for(:tasks)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }

end