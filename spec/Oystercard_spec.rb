require 'Oystercard'
describe Oystercard do

 describe "balance" do
   it "Has a default balance of 0" do
     expect(subject.balance).to eq(0)
   end
 end

end
