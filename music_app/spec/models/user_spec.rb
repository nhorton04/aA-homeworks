require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

  describe User do
    subject (:user) do
      FactoryBot.build(:user.
      email: "nick@website.com",
      password: "hunter12")
    end

    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6)}

    it "creates a password digest from a given password" do
      expect(user.password_digest).to_not be_nil
    end

    it "creates a session token before validation" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to)not eq(old_session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("hunter12")).to be true
    end

    it "verifies a password is not correct" do
      expect(user.is_password?("starwars")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given good credentials" do
      expect(User.find_by_credentials("nick@website.com", "hunter12")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("nick@website.com", "hunter13")).to eq(nil)
    end
  end
end
