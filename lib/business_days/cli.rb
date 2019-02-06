require 'business_days'
require 'thor'

module BusinessDays
  class CLI < Thor
		desc "days 'start_date' 'end_date'", "Get the business days between two dates"
		def days(start_date, end_date)
			BusinessDays::Init::INIT_CONFIG[:work_week] = %(mon tue)
		  puts BusinessDays::Day.days(start_date, end_date)
		end

		desc "init file", "Return initial configuration"
		def init(file)
		  puts BusinessDays::Init::INIT_CONFIG[:holidays] << BusinessDays::Init.load_config(file)
		end

		desc "load_file 'file_path'", "Reads a file"
		def load_file(file)
		  puts BusinessDays::Init.load_config(file)
		end

		desc "observed 'date'", "Gets the observed day of a holiday"
		def observed(date)
		  puts BusinessDays::Holidays.observed(date)
		end
  end
end