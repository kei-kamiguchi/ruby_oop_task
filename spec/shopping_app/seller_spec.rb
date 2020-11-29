require "spec_helper"

RSpec.describe Seller do
  let(:seller) { build(:seller) }

  it "Userを継承していること" do
    expect(Customer.superclass).to eq User
  end

  describe "#initialize" do
    it "@nameを持つこと" do
      expect(seller.instance_variable_get(:@name)).to be_truthy
    end
    it "自身がownerとなっている@walletを持つこと" do
      expect(seller.instance_variable_get(:@wallet).owner).to eq seller
    end
  end

  describe "#wallet" do
    it "自身がownerとなっているWalletオブジェクトを返すこと" do
      wallet = seller.wallet
      expect(wallet.class == Wallet).to eq true
      expect(wallet.owner == seller).to eq true
    end
    it "'#wallet='は定義されていないこと（attr_readerを使っていること）" do
      expect(seller.methods.include?(:wallet=)).to eq false
    end
  end
end