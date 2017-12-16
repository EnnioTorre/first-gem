RSpec.describe First::Gem do
  it "has a version number" do
    expect(First::Gem::VERSION).not_to be nil
  end

  it "broccoli is gross" do
    expect(First::Gem::Food.portray("Broccoli")).to eql("Gross!")
  end

  it "anything else is delicious" do
    expect(First::Gem::Food.portray("Not Broccoli")).to eql("Delicious!")
  end

end
