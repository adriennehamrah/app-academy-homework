require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  subject(:user) do
    User.new(email: "email@gmail.com", password: "123456")
  end

  describe "#is_password?" do
    it "verifies the password" do
      expect(user.is_password?("123456")).to be true
    end
  end

  describe "#reset_session_token!" do
    it "resets the session token" do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(old_token)
    end

    it "should call 'save'" do
      expect(user).to receive(:save)
      user.reset_session_token!
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    it "returns the correct user, given valid credentials" do
      expect(User.find_by_credentials(
        "email@gmail.com", "123456")).to eq(user)
    end

    it "return nil, given invalid credentials" do
      expect(User.find_by_credentials(
        "noemail", "nopassword")).to eq(nil)
    end
  end
end
