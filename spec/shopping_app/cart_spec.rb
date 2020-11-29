require "spec_helper"

RSpec.describe Cart do
  let(:customer) { build(:customer) }
  let(:cart) { build(:cart, owner: customer) }
  let(:item) { build(:item) }

  describe "#initialize" do
    it "@ownerを持つこと" do
      expect(cart.instance_variable_get(:@owner)).to be_truthy
    end
    it "@contentsを持つこと" do
      expect(cart.instance_variable_get(:@contents)).to be_truthy
    end
  end

  describe "#owner" do
    it "owner属性に定義されているオブジェクトを返すこと" do
      expect(cart.owner).to eq customer
    end
    it "'#owner='は定義されていないこと（attr_readerを使っていること）" do
      expect(cart.methods.include?(:owner=)).to eq false
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
end