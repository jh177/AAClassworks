require 'rails_helper'

# RSpec.describe User, type: :model do
describe User do
  subject(:user) {User.new(email: "aji@aji.com", password: "123456")}

  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_valid_password?" do

    it "check if a password is correct" do
      expect(user.is_valid_password?("123456")).to be true
    end
    
    it "return false if password is incorect" do
      expect(user.is_valid_password?("111111")).to be false
    end
  end

  describe "#reset_session_token" do

    it "reset the session token for user" do
      old_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_session_token)
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "find the user if credentials are correct" do
      found_user = User.find_by_credentials("aji@aji.com", "123456")
      expect(found_user).to eq(user)
    end

    it "return nil if credentials are incorrect" do
      found_user = User.find_by_credentials("aji@aji.com", "111111")
      expect(found_user).to eq(nil)
    end
  end

end

