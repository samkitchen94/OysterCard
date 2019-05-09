require 'station'
describe Station do

  station = Station.new("here", 4)

  it "stores station name when it initializes" do
    expect(station.name).to eq("here")
  end

  it "stores the zone when it initializes" do
    expect(station.zone).to eq(4)
  end


end
