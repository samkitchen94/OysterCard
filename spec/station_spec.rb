require 'station'
describe Station do

  it "stores station name when it initializes" do
    station = Station.new("here", 4)
    expect(station.name).to eq("here")
  end

  it "stores the zone when it initializes" do
    station = Station.new("here", 4)
    expect(station.zone).to eq(4)
  end
end
