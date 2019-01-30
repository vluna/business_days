require 'business_days'

describe BusinessDays::Day do
  it "broccoli is gross" do
    expect(BusinessDays::Day.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(BusinessDays::Day.portray("Not Broccoli")).to eql("Delicious!")
  end
end