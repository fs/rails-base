require "rails_helper"

feature "Sign in with social account" do
  context "when oauth confirmed" do
    context "when user found by uid" do
      context "when user confirmed" do
      end

      context "when user not confirmed" do
      end
    end

    context "when user found by email" do
      context "when user confirmed" do
      end

      context "when user not confirmed" do
      end
    end

    context "when user not found" do
    end
  end

  context "when oauth not confirmed" do
    context "when user found by uid" do
    end

    context "when user found by email" do
    end

    context "when user not found" do
    end
  end
end
