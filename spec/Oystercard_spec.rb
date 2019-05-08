require 'Oystercard'
describe Oystercard do

  def one_journey
    subject.top_up(10)
    subject.touch_in(:station)
    subject.touch_out
  end

  def touched_in
    subject.top_up(10)
    subject.touch_in(:station)
  end

  describe "let" do
    let(:station) { double :station }
    it "stores the entry station" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

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
     touched_in
     expect{ subject.touch_out }.to change{ subject.balance }.by(-1)
   end

   # it "raise an error if balance is less than default balance" do
   #   expect { subject.deduct(5) }.to raise_error("please top up, minimum balance reached")
   # end

  describe "Oystercard functions" do
    it "Oystercard can touch in and be in journey" do
      touched_in
      expect(subject.in_journey?).to be true
    end

    it "Raises an error if already touched in" do
      touched_in
      expect{ subject.touch_in(:station) }.to raise_error("In journey, can't touch in again")
    end

    it " raises an error if minimum balance is less than £1" do
      subject.balance < Oystercard::MIN_FARE
      expect{ subject.touch_in(:station) }.to raise_error("insufficient balance")
    end

    it "Raises and error if already touched out" do
      one_journey
      expect{ subject.touch_out }.to raise_error("Already touched out")
    end

    it "Deducts the fare after touching out" do
      touched_in
      expect{ subject.touch_out }.to change{subject.balance}.by(-1)
    end

    it "Oystercard can be in_journey?" do
      expect(subject.in_journey?).to be false
    end

  end

 end

end
