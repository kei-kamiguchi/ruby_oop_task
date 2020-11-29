require "spec_helper"

RSpec.describe Cart do
  let(:customer) { build(:customer) }
  let(:cart) { build(:cart, owner: customer) }
  let(:seller) { build(:seller) }
  let(:item) { build(:item, owner: seller) }

  it "ItemManagerをincludeしていること" do
    expect(Cart.included_modules.include?(ItemManager)).to eq true
  end
  it "Ownableをincludeしていること" do
    expect(Cart.included_modules.include?(Ownable)).to eq true
  end

  describe "#initialize" do
    it "@ownerを持つこと" do
      expect(cart.instance_variable_get(:@owner)).to be_truthy
    end
    it "@contentsを持つこと" do
      expect(cart.instance_variable_get(:@contents)).to be_truthy
    end
  end

  describe "#items" do
    it "@contentsを返すこと（ItemManager#itemsをオーバーライドしている）" do
      expect(cart.items).to eq cart.instance_variable_get(:@contents)
    end
  end

  describe "#add(item)" do
    it "@contentsに格納されること" do
      cart.add(item)
      expect(cart.instance_variable_get(:@contents).include?(item)).to eq true
    end
  end

  describe "#total_amount" do
    it "@contentsに格納されているItemオブジェクトの値段の合計を返すこと" do
      cart.add(item)
      expect(cart.total_amount).to eq item.price
    end
  end

  describe "#check_out" do
    let(:balance) { 99999999999 }
    before do
      customer.wallet.deposit(balance)
      # check_out前
      expect(customer.wallet.balance == balance).to eq true
      expect(item.owner == seller).to eq true
      expect(seller.wallet.balance == 0).to eq true

      cart.add(item)
      cart.check_out
    end
    it "カートの中身（Cart#items）のすべてのアイテムの購入金額が、カートのオーナーのウォレットからアイテムのオーナーのウォレットに移されること" do
      expect(customer.wallet.balance == balance - item.price).to eq true 
      expect(seller.wallet.balance == item.price).to eq true 
    end
    it "カートの中身（Cart#items）のすべてのアイテムのオーナー権限が、カートのオーナーに移されること" do
      expect(item.owner == customer).to eq true
    end
    it "カートの中身（Cart#items）が空になること" do
      expect(cart.items == []).to eq true 
    end
  end
end