require 'Oystercard'
describe Oystercard do

 describe "balance" do
   it "Has a default balance of 0" do
     expect(subject.balance).to eq(0)
   end

   it "tops up the oystercard and returns new amount" do
     subject.top_up(5)
     expect(subject.balance).to eq(5)
   end
 end

end
