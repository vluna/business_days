require 'active_support'
require 'active_support/core_ext'

module BusinessDays
  class Holidays
	  def self.observed(date)
	  	_days = Date::ABBR_DAYNAMES.to_a
	  	_work_days = %w(mon tue wed thu fri).map{|e| e.capitalize }
	  	_weekend_days = (_days + _work_days - (_days & _work_days)).map{|e| DateTime.parse(e).wday}
	    date = date.to_date

	    if _weekend_days.include?(date.wday)
	      date += 1.days until date.wday == 1
	    end

	    return date.strftime('%Y-%m-%d')
	  end
  end
end