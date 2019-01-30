require 'active_support/core_ext/date/calculations'
require 'active_support/core_ext/string/conversions'

module BusinessDays
  class Day
		def self.days(start_date, end_date, options = {})
			if options.any?
				_include_holidays = options[:include_holidays] unless options[:include_holidays].blank?
			end
			
			year = options[:year].blank? ? Date.today.year : options[:year]

	    count = 0
	    # holidays = canadian_holidays(year)
	    (start_date.to_date...end_date.to_date.beginning_of_day).each do |d|
	      if d.strftime('%Y').to_i == year
	        if (1..5).include?(d.wday)
	          # _is_holiday = holidays.find{|h| h[:start_date] == d.strftime('%Y-%m-%d')}
	          count += 1 #if _is_holiday.blank?
	          # count += ((0.5 if _is_holiday[:full_day] == 0) unless _is_holiday.blank?).to_f
	        end
	      end
	    end
	    return count
	  end
  end
end