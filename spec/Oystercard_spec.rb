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

   it "Raises error is balance greater than £90" do
     subject.top_up(Oystercard::MAX_BALANCE)
     expect{ subject.top_up(1) }.to raise_error("Max balance £90")
   end

   it "deducts the balance and returns new balance" do
     subject.top_up(10)
     subject.deduct(5)
     expect(subject.balance).to eq(5)
   end

 end

end
