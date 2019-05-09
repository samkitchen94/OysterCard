require 'journey'

describe Journey do

  it "defaults as empty hash" do
    expect(subject.journey).to be_empty
  end

  it "Oystercard can be in_journey?" do
    expect(subject.in_journey?).to be false
  end
  
end
