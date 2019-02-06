require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/string/conversions'

module BusinessDays
  class Day
		def self.days(start_date, end_date)
	    count = 0
	    (start_date.to_date...end_date.to_date.beginning_of_day).each do |d|
        if BusinessDays::Init::INIT_CONFIG[:work_week].include?(d.strftime('%a').downcase)
          count += 1
        end
	    end
	    return count
	  end
  end
end