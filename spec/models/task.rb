require 'rails_helper'

RSpec.describe Task, type: :model do
  it {should accept_nested_attributes_for(:attachments)}
  it {should accept_nested_attributes_for(:user_tasks)}
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:deadline) }

end