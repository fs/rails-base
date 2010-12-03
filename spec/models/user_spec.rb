require 'spec_helper'

describe User do
  it { should allow_mass_assignment_of(:full_name) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }

  it { should validate_presence_of :full_name }

  context 'class methods:' do
    context '#find_by_identity_for' do
      context 'when current_user given' do
        let(:current_user) { Factory :confirmed_user }

        context 'identity exists for given provider and uid' do
          let(:identity) { Factory :twitter_identity, :user => current_user }
          let(:method) { lambda { User.find_by_identity_for(identity.provider, identity.uid, current_user) } }
          before { identity }

          it 'should return current user' do
            method.call.should eql current_user
          end

          it 'should not create new identity' do
            method.should_not change(UserIdentity, :count)
          end
        end

        context 'identity does not exists for given provider and uid' do
          let(:method) { lambda { User.find_by_identity_for('twitter', '1', current_user) } }

          it 'should return current user' do
            method.call.should eql current_user
          end

          it 'should create new identity' do
            method.should change(current_user.identities, :count).by(1)
          end

          context 'new identity' do
            let(:identity) { method.call.identities.first }
            it { identity.provider.should eql 'twitter' }
            it { identity.uid.should eql '1' }
          end
        end
      end
    end
  end
end
