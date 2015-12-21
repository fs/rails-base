require "rails_helper"

describe VerifiedAuthOrganizer do
  include_context :auth_hashie

  let(:service) { described_class.new(auth_hashie) }

  before do
    allow(SocialProfile).to receive_message_chain(:from_omniauth, :user)
    allow(UserFoundByEmail).to receive_message_chain(:new, :call)
    allow(CreateUserFromAuth).to receive_message_chain(:new, :call)
    service.user
  end

  it "fetches existing user or create new one" do
    expect(SocialProfile).to have_received(:from_omniauth)
    expect(UserFoundByEmail).to have_received(:new)
    expect(CreateUserFromAuth).to have_received(:new)
  end
end
