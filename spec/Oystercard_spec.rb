require 'Oystercard'

describe Oystercard do

let(:entry_station) { double :entry_station }
let(:exit_station) { double :exit_station }


  def one_journey
    subject.top_up(10)
    subject.touch_in(:entry_station)
    subject.touch_out(:exit_station)
  end

  def touched_in
    subject.top_up(10)
    subject.touch_in(:entry_station)
  end

  describe "let" do
    #let(:station) { double :station }
    it "stores the entry station" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
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
     expect{ subject.touch_out(:exit_station) }.to change{ subject.balance }.by(-1)
   end

  describe "Oystercard touch in and touch out" do

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
      expect{ subject.touch_out(:exit_station) }.to raise_error("Already touched out")
    end

    it "Deducts the fare after touching out" do
      touched_in
      expect{ subject.touch_out(:exit_station) }.to change{subject.balance}.by(-1)
    end

    it "Oystercard can be in_journey?" do
      expect(subject.in_journey?).to be false
    end

    it "oystercard responds to touch out with one argument" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject).to respond_to(:touch_out).with(1).argument
    end

    # it "card should remember exit station" do
    #   touched_in
    #   expect(subject.touch_out(exit_station)).to eq(exit_station)
    # end

    it "defaults journey as empty hash" do
      expect(subject.journey).to be_empty
    end

    it "stores journey in a hash" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey).to eq({entry_station => exit_station})
    end
  end

 end

end
