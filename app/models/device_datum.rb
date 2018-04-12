class DeviceDatum < ApplicationRecord
	validates :identifier, :date_time, :value, :unit, presence: true
	validates :value, numericality: true
	validate :date_time_value

	def date_time_value
    errors.add(:date_time, 'must be a valid datetime') if ((DateTime.parse(date_time.to_s) rescue ArgumentError) == ArgumentError)
  end
end
