require 'yaml'

module BusinessDays
  class Init
  	INIT_CONFIG = {
      holidays: SortedSet.new,
      work_week: %w(mon tue wed thu fri),
    }

	  class << self
	  	def load_config(file)
	  		if File.exist?(file)
	        data = YAML::load(File.open(file))
	        holidays = (data["holidays"] || {})
	      else
	      	puts "File not found"
	      end
      end
	  end
  end
end