require 'business_days'
require 'thor'

module BusinessDays
  class CLI < Thor
		desc "days start_date end_date", "Get the business days between two dates"
		def days(start_date, end_date)
		  puts BusinessDays::Day.days(start_date, end_date)
		end
  end
end