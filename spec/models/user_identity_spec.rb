require 'spec_helper'

describe UserIdentity do
  it { should belong_to :user }
end
