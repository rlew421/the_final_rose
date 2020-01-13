class Bachelorette <ApplicationRecord
  has_many :contestants

  def average_contestant_age
    contestants.average(:age).to_f.round(1)
  end

  def distinct_hometowns
    contestants.select(:hometown).distinct.pluck(:hometown)
  end
end
