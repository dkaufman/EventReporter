require 'queue.rb'

module EventManagement
  class Search

    def self.for(file, queue, headers, criteria)
      if file
        filters = criteria.split(" and ")
        if filters.length == 2
          queue = find_by_two(file, headers, filters)
        else
          queue = find_by_single(file, headers, criteria)
        end
        puts "Search returned #{queue.size} records."
      else puts "No file has been loaded."
      end
      return queue
    end

    def self.find_by_single(file, headers, subcommand)
      parts = subcommand.split
      attribute = parts[0].intern
      criteria = parts[1..-1].join(" ")

      queue = reset_queue(file, headers)

      queue.select! do |attendee|
        attendee[attribute].casecmp(criteria) == 0 if attendee[attribute]
      end
    end

    def self.find_by_two(file, headers, filters)
      attribute1 = filters[0].split[0].intern
      criteria1 = filters[0].split[1].strip
      attribute2 = filters[1].split[0].intern
      criteria2 = filters[1].split[1].strip

      queue = reset_queue(file, headers)

      queue.select!{ |attendee| attendee[attribute1].casecmp(criteria1) == 0 }
      queue.select!{ |attendee| attendee[attribute2].casecmp(criteria2) == 0 }
    end

    def self.subtract(file, queue, headers, subcommand)
      parts = subcommand.split
      attribute = parts[1].intern
      criteria = parts[2..-1].join(" ")

      queue.reject! do |attendee|
        attendee[attribute].casecmp(criteria) == 0 if attendee[attribute]
      end
    end

    def self.add(file, queue, headers, subcommand)
      parts = subcommand.split
      attribute = parts[1].intern
      criteria = parts[2..-1].join(" ")

      add_to = reset_queue(file, headers)
      add_to.select!{ |attendee| attendee[attribute].casecmp(criteria) == 0 }
      new_queue = queue | add_to
    end

    def self.reset_queue(file, headers)
      file.rewind
      queue = Queue.load(file, headers)
    end
  end
end
