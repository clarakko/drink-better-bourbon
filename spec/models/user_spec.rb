require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_valid(:username).when('pablo') }
  it { should_not have_valid(:username).when('', nil) }

  it { should have_valid(:email).when('user@example.com', 'pablo@escobar.com') }
  it { should_not have_valid(:email).when('', nil, 'pablo', '123.com') }

  it 'has matching password and password confirmation' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'thehillshaveyes'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

  describe '.admin?' do
    context 'user is admin' do
      it 'should return true' do
        admin = FactoryGirl.create(:user, role: 'admin')
        expect(admin.admin?).to eq true
      end
    end

    context 'user is not admin' do
      it 'should return false' do
        user = FactoryGirl.create(:user)
        expect(user.admin?).to eq false
      end
    end
  end
end
