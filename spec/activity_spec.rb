require 'rspec'
require './lib/activity'

RSpec.describe Activity do
  let(:activity) { Activity.new("Brunch") }

  describe "#initialize" do
    it "exists" do
      expect(activity).to be_a(Activity)
    end

    it "has attributes" do
      expect(activity.name).to eq("Brunch")
      expect(activity.participants).to eq({})
    end
  end

  describe "#add_participant" do
    it "it adds participant to participants hash" do
      activity.add_participant("Maria", 20)
      expect(activity.participants).to eq({"Maria" => 20})
    end
  end
  
  describe "#total_cost" do
    it "can calulate the total cost of an activity" do
      activity.add_participant("Maria", 20)
      expect(activity.total_cost).to eq(20)

      activity.add_participant("Luther", 40)
      expect(activity.participants).to eq({"Maria" => 20, "Luther" => 40})
      expect(activity.total_cost).to eq(60)
    end
  end
  
  ### IT 2 ###

  describe "#split" do
    it "#split" do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expect(activity.total_cost).to eq(60)
    expect(activity.split).to eq(30)
    end
  end

  describe "#owed" do
    it "#owed" do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expect(activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end


  # it "has attributes" do
  #   expect().to eq()
  # end


end