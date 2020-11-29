require "spec_helper"

RSpec.describe User do
  let(:user) { build(:user) }

  it "ItemManagerをincludeしていること" do
    expect(Customer.included_modules.include?(ItemManager)).to eq true
  end

  describe "#initialize" do
    it "@nameを持つこと" do
      expect(user.instance_variable_get(:@name)).to be_truthy
    end
  end

  describe "#name" do
    let(:name) { "name" }
    let(:user) { build(:seller, name: name) }
    it "name属性に定義されている文字列を返すこと" do
      expect(user.name).to eq name
    end
  end

  describe "#name=" do
    let(:name) { "name" }
    before do
      user.name = name
    end
    it "nameを変更できること" do
      expect(user.name).to eq name
    end
  end
end