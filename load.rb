require 'csv'

module EventManagement
  class Load
    def self.new(filename, options)
        filename = filename.empty? ? "event_attendees.csv" : filename
        file = CSV.open(filename, options)
        headers = file.first.collect{ |header| header }

        return file, headers
    end
  end
end