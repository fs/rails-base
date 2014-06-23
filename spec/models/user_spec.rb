require 'spec_helper'

describe User, :type => :model do
  it { is_expected.to validate_presence_of :full_name }
end
