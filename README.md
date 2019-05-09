1 - In order to use public transport
As a customer
I want money on my card

Object | Message
card   | Balance - default value = 0
                                    Feature Test:

RED -
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ irb
2.6.0 :001 > exit
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ irb
2.6.0 :001 > require './lib/Oystercard'
 => true
2.6.0 :002 > oyster = Oystercard.new
Traceback (most recent call last):
        4: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):2
NameError (uninitialized constant Oystercard)
2.6.0 :003 > exit


2 - In order to keep using public transport
As a customer
I want to add money to my card

Object | Message
card   | top_up --> balance

                                    Feature Test:
RED -
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ irb
2.6.0 :001 > require './lib/Oystercard'
 => true
2.6.0 :002 > oyster = Oystercard.new
 => #<Oystercard:0x00007f9d1796b728>
2.6.0 :003 > oyster.balance
Traceback (most recent call last):
        4: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `balance' for #<Oystercard:0x00007f9d1796b728>)
2.6.0 :004 > exit

GREEN -
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ irb
2.6.0 :001 > require './lib/Oystercard'
 => true
2.6.0 :002 > oyster = Oystercard.new
 => #<Oystercard:0x00007feb698bb350 @value=0>
2.6.0 :003 > oyster.balance
 => 0
2.6.0 :004 > exit
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ rspec
Finished in 0.00884 seconds (files took 0.08904 seconds to load)
1 example, 0 failures

3 - In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card

Object | Message
card   | modify top_up --> MAX_LIMIT = 90 --> balance
                                Feature Test:

RED -
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ irb
2.6.0 :001 > require './lib/Oystercard'
 => true
2.6.0 :002 > oyster = Oystercard.new
 => #<Oystercard:0x00007fe3f5197338 @balance=0>
2.6.0 :003 > oyster.top_up
Traceback (most recent call last):
        4: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `top_up' for #<Oystercard:0x00007fe3f5197338 @balance=0>)
2.6.0 :004 > exit

GREEN -
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ irb
2.6.0 :001 > require './lib/Oystercard'
 => true
2.6.0 :002 > oyster = Oystercard.new
 => #<Oystercard:0x00007f8eb69c69d0 @balance=0>
2.6.0 :003 > oyster.top_up(5)
 => 5
2.6.0 :004 > oyster.top_up(5)
 => 10
2.6.0 :005 > exit

4 - In order to pay for my journey
As a customer
I need my fare deducted from my card

Object | Message
card   | deduct --> balance
                                Feature Test:
RED -
Vijays-MacBook-Pro:OysterCard_Lucy vijaykurian$ irb
2.6.0 :001 > require './lib/Oystercard'
 => true
2.6.0 :002 > oyster = Oysercard.new
Traceback (most recent call last):
        4: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):2
NameError (uninitialized constant Oysercard)
Did you mean?  Oystercard
2.6.0 :003 > oyster = Oystercard.new
 => #<Oystercard:0x00007f9ed9109558 @balance=0, @max_bal=90>
2.6.0 :004 > oyster.deduct(amount)
Traceback (most recent call last):
        4: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        3: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        2: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        1: from (irb):4
NameError (undefined local variable or method `amount' for main:Object)
2.6.0 :005 > oyster.deduct
Traceback (most recent call last):
        5: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `<main>'
        4: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/bin/irb:23:in `load'
        3: from /Users/vijaykurian/.rvm/rubies/ruby-2.6.0/lib/ruby/gems/2.6.0/gems/irb-1.0.0/exe/irb:11:in `<top (required)>'
        2: from (irb):5
        1: from (irb):5:in `rescue in irb_binding'
NoMethodError (undefined method `deduct' for #<Oystercard:0x00007f9ed9109558 @balance=0, @max_bal=90>)
2.6.0 :006 > quit

GREEN -

---

In order to know where I have been
As a customer
I want to see all my previous trips

object | behaviours
-|-
customer |
oystercard | view_trips

```
Makerss-MacBook-Pro-8:OysterCard student$ irb
2.6.0 :001 > require './lib/Oystercard'
 => true
2.6.0 :002 > card = Oystercard.new
 => #<Oystercard:0x00007fdd771a7528 @balance=0, @max_bal=90, @entry_station=nil, @exit_station=nil, @journey={}>
2.6.0 :003 > card.top_up(10)
 => 10
2.6.0 :004 > card.touch_in("here")
 => "here"
2.6.0 :005 > card.touch_out("there")
 => {"here"=>"there"}
```
---
In order to know how far I have travelled
As a customer
I want to know what zone a station is in

object | behaviours
-|-
customer |
station | zone

```
Makerss-MacBook-Pro-8:OysterCard student$ irb -r ./lib/station
2.6.0 :001 > station = Station.new("here", 4)
 => #<Station:0x00007ff0aba5a6b0 @name="here", @zone=4>
2.6.0 :002 > station.zone
 => 4
2.6.0 :003 > station.name
 => "here"

 ```

 ---

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

object | behaviours
-|-
customer |
card | penalty_charge
journey | start_journey, end_journey, calculate_fare, is_complete?

```

```
