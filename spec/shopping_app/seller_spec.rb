require "spec_helper"

RSpec.describe Seller do
  let(:seller) { build(:seller) }

  it "ItemManagerをincludeしていること" do
    expect(Customer.included_modules.include?(ItemManager)).to eq true
  end

  describe "#initialize" do
    it "@nameを持つこと" do
      expect(seller.instance_variable_get(:@name)).to be_truthy
    end
    it "自身がownerとなっている@walletを持つこと" do
      expect(seller.instance_variable_get(:@wallet).owner).to eq seller
    end
  end

  describe "#name" do
    let(:name) { "name" }
    let(:seller) { build(:seller, name: name) }
    it "name属性に定義されている文字列を返すこと" do
      expect(seller.name).to eq name
    end
    it "'#name='は定義されていないこと（attr_readerを使っていること）" do
      expect(seller.methods.include?(:name=)).to eq false
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