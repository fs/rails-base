require "rails_helper"

describe CreateUserFromAuth do
  include_context :auth_hashie

  let(:user) { User.last }
  let(:service) { described_class.new(auth_hashie) }
  let(:sent_emails) { ActionMailer::Base.deliveries.count }

  subject { service.call }

  it "creates new user from auth hash" do
    expect { subject }.to change { User.count }.by(1)
    expect(sent_emails).to eq(0)
  end
end
