class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end
  
  def add_participant(name, money_paid)
    participants[name] = money_paid
  end

  def total_cost
    participants.values.sum
  end

  def split
    total_cost / participants.count
  end

  def owed
    name_money_owed = Hash.new

    participants.each do |name, money_paid|
      name_money_owed[name] = (split - money_paid)
    end

    name_money_owed
  end
end