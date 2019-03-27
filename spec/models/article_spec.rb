require 'rails_helper'

RSpec.describe Article, type: :model do
  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end

  it { is_expected.to belong_to(:author).class_name('User') }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_most(140) }
end
