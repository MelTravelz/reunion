require 'rspec'
require './lib/activity'
require './lib/reunion'

RSpec.describe Reunion do 
  let(:reunion) { Reunion.new("1406 BE") }
  let(:activity_1) { Activity.new("Brunch") }
  let(:activity_2) { Activity.new("Drinks") }

  describe "#initialize" do
    it "exists" do
      expect(reunion).to be_a(Reunion)
    end

    it "has attributes" do
      expect(reunion.name).to eq("1406 BE")
      expect(reunion.activities).to eq([])
    end
  end

  describe "#add_activity" do
    it "can add activity to activities array" do
      reunion.add_activity(activity_1)

      expect(reunion.activities).to eq([activity_1])
    end
  end 

  describe "#total_cost" do
    it "can caculate the total cost of the reunion(many activities)" do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)

      reunion.add_activity(activity_1)

      expect(reunion.total_cost).to eq(60)

      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0) 

      reunion.add_activity(activity_2)

      expect(reunion.total_cost).to eq(180)
    end
  end

  describe "#breakout" do
    it "can split bill & cacluate participant money owed" do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      reunion.add_activity(activity_1)

      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0) 
      reunion.add_activity(activity_2)

      expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    end
  end   

  describe "#summary" do
    it "legibly prints the breakout(names and money owed)" do
      activity_1.add_participant("Maria", 20)
      activity_1.add_participant("Luther", 40)
      reunion.add_activity(activity_1)

      activity_2.add_participant("Maria", 60)
      activity_2.add_participant("Luther", 60)
      activity_2.add_participant("Louis", 0) 
      reunion.add_activity(activity_2)

      expect(reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
    end
  end

end