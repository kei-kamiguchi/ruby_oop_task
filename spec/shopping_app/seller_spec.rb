require "spec_helper"

RSpec.describe Seller do
  let(:seller) { build(:seller) }

  it "Userを継承していること" do
    expect(Customer.superclass).to eq User
  end

end