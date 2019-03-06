class Trace < ApplicationRecord

  # I would avoid validation on rails side and set validations on database side
  # This would improve the performance greatly when a lot of writes are expected
  # Since the challenge sets the scenario where there are more reads than writes then I'm gonna go with rails validations
  # Even if the scenario says this I would be wary of the amount of writes and adapt accordingly

  # A 500+ records insert with validation takes 127ms, with database validation goes down to almost half at 71ms
  # import([:latitude, :longitude], traces, validate: false)

  validates :latitude, presence: true, numericality: { only_float: true, greater_than_or_equal_to: -90, less_than_or_equal_to: 90}
  validates :longitude, presence: true, numericality: { only_float: true, greater_than_or_equal_to: -180, less_than_or_equal_to: 180}

  class << self
    def upload_data(traces)
      transaction do
        import([:latitude, :longitude], traces)
      end
    end
  end
end
