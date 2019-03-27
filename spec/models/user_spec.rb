require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it { is_expected.to have_many(:articles).dependent(:destroy) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(255) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(255) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }

  describe "email testing" do
    let(:user) { build(:user) }

    context "email with invalid addresses" do

      %w[user@example,com user_at_foo.org user.name@example.
        foo@bar_baz.com foo@bar+baz.com].each do |invalid_address|
        before do
          user.email = invalid_address
        end

        it { expect(user.valid?).to be_falsy }
      end
    end

    context "the same addresses" do
      let(:another_user) { create(:user) }

      before do
        user.email = another_user.email
      end

      it { expect(user.valid?).to be_falsy }
    end

    context "set case_sensitive false" do
      let(:another_user) { create(:user, email: "USER@EXAMPLE.COM") }

      before do
        user.email = another_user.email.downcase
      end

      it { expect(user.valid?).to be_falsy }
    end
  end
end
