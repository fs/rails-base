require "rails_helper"

describe ProcessUserConfirmation do
  let(:user) { create(:user) }
  let(:service) { described_class.new(user) }

  before do
    allow(user).to receive(:confirm)
    allow(user).to receive(:send_reset_password_instructions)
    service.call
  end

  it "invokes user confirmation methods" do
    expect(user).to have_received(:confirm)
    expect(user).to have_received(:send_reset_password_instructions)
  end
end
