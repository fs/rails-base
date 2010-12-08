require 'spec_helper'

describe User do
  it { should have_many :identities }

  context '#password_required?' do
    subject { user.password_required? }

    context 'when user has identity' do
      let(:user) { Factory(:user_registered_over_twitter) }

      it { should be_false }

      context 'and when #password is in place' do
        before { user.password = '123456' }
        it { should be_true }
      end

      context 'and when #password_confirmation is in place' do
        before { user.password_confirmation = '123456' }
        it { should be_true }
      end
    end

    context 'when user has no identity' do
      let(:user) { User.find(Factory(:confirmed_user).id) } # we need clean record from db without password attribute

      it { should be_false }

      context 'and when #password is on place' do
        before { user.password = '123456' }
        it { should be_true }
      end

      context 'and when #password_confirmation is in place' do
        before { user.password_confirmation = '123456' }
        it { should be_true }
      end
    end

    context 'when use is a new record' do
      let(:user) { User.new }
      it { should be_true }
    end
  end

  context '#valid_password?' do
    context 'when user has no password stored in the db' do
      let(:user) { Factory(:user_registered_over_twitter) }
      subject { user.valid_password?('any password') }

      it { should be_true }
    end

    context 'when user has password in db' do
      let(:user) { Factory(:confirmed_user) }

      context 'when right password given' do
        subject { user.valid_password?('123456') }
        it { should be_true }
      end

      context 'when wrong password given' do
        subject { user.valid_password?('right password is 123456') }
        it { should be_false }
      end
    end
  end

  context '#password_stored?' do
    context 'when user has password stored in the db' do
      let(:user) { Factory(:user, :password => '123456') }
      subject { user.password_stored? }

      it { should be_true }

      context 'when user set #password to blank string without saving' do
        before { user.password = '' }
        it { should be_true }
      end

      context 'when user set #encrypted_password to blank string without saving' do
        before { user.encrypted_password = '' }
        it { should be_true }
      end
    end

    context 'when user has blank password stored in the db' do
      let(:user) { Factory(:user_registered_over_twitter) }
      subject { user.password_stored? }

      it { should be_false }

      context 'when user set #password without saving' do
        before { user.password = '123456' }
        it { should be_false }
      end

      context 'when user set #encrypted_password without saving' do
        before { user.encrypted_password = '' }
        it { should be_false }
      end
    end

    context 'when unsaved user given' do
      context 'with #password' do
        subject { User.new(:password => '123456').password_stored? }
        it { should be_false }
      end

      context 'with #encrypted_password' do
        subject { User.new(:encrypted_password => '123456').password_stored? }
        it { should be_false }
      end
    end
  end

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

    context '#new_with_session' do
      let(:params) { {} }
      let(:session) { {} }
      let(:user) { User.new_with_session(params, session) }

      context 'when data in params' do
        let(:params) { {'full_name' => 'John Smith'} }

        it 'should set fields from params' do
          user.full_name.should eql 'John Smith'
        end
      end

      context 'when omniauth data in session' do
        let(:session) { {'devise.omniauth_data' => {
            'user_info' => {
                'name' => 'John Smith',
                'email' => 'john@example.com'
            },
            'provider' => 'twitter',
            'uid' => '1'
        }} }

        it 'should set email from session' do
          user.email.should eql 'john@example.com'
        end

        it 'should set name from session' do
          user.full_name.should eql 'John Smith'
        end

        it 'should skip confirmation' do
          user.should be_confirmed
        end

        context 'new identity' do
          let(:new_identity) { user.identities.last }

          it 'should be associated with provider from session' do
            new_identity.provider.should eql('twitter')
          end

          it 'should be associated with uid from session' do
            new_identity.uid.should eql('1')
          end
        end
      end

      context 'when data in params and data in session' do
        let(:params) { {'full_name' => 'John Smith from params'} }
        let(:session) { {'devise.omniauth_data' => {'user_info' => {
            'name' => 'John Smith from session',
        }}} }

        it 'should set data from params only' do
          user.full_name.should eql 'John Smith from params'
        end
      end
    end
  end
end
