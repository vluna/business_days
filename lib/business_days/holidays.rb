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

	   def get_easter_sunday(year)
	    year = year.to_i
	    a = year % 19
	    b = year >> 2
	    c = (b / 25).floor + 1
	    d = (c * 3) >> 2
	    e = ((a * 19) - ((c * 8 + 5) / 25).floor + d + 15) % 30
	    e += (29578 - a - e * 32) >> 10
	    e -= ((year % 7) + b - d + e + 2) % 7
	    d = e >> 5
	    day = e - d * 31
	    month = d + 3

	    return "#{year}-#{month}-#{day}".to_date.strftime('%Y-%m-%d')
	  end
  end
end