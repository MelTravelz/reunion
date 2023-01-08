class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    activities << activity
  end

  def total_cost
    activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    reunion_owed = Hash.new(0)
    # reunion_owed = Hash.new { |hash, key| hash[key] = 0}

    activities.each do |activity|
      activity.owed.each do |name, money_owed|
        # reunion_owed[name] = reunion_owed[name] + money_owed
        reunion_owed[name] += money_owed
      end
    end
    reunion_owed
  end

  def summary
    legible_summary = ""

    breakout.each do |name, money_owed|
      legible_summary += "#{name}: #{money_owed}\n"
      # legible_summary << "#{name}: #{money_owed}\n"
    end
    legible_summary.chomp
  end

end