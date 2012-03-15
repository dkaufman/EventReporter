require 'attendee'
require 'ap'

module EventManagement
  class Queue
    HEADERS = [ "Last Name", "First Name", "Email Address",
                "Zipcode", "City", "State", "Street", "Homephone"]

    def self.load(file, headers)
      if file
        queue = clear

        file.each do |line|
          attendee = Attendee.new(headers, line)
          queue << attendee.attendee_data
        end
      else
        puts "No file has been loaded."
      end

      return queue
    end

    def self.clear
      []
    end

    def self.functions(queue, headers, subcommand)
        case subcommand
          when 'count'
            puts queue.size
            return queue
          when 'clear'
            queue = clear
          when 'print'
            print(queue)
          when /^print by/
            order_by = subcommand.split[2..-1].join(" ")
            print_by(queue, headers, order_by)
          when /^save to/
            filename = subcommand.split[2]
            save_to(queue, headers, filename)
        end

      queue
    end

    def self.print(queue)
      if queue.any?
        puts HEADERS.join("\t")
        queue.each do |attendee|
          raw_output = raw(attendee)
          puts raw_output.join("\t")
        end
      end
    end

    def self.print_by(queue, headers, order_by)
      sorted_queue = queue.sort_by{ |attendee| attendee[order_by.to_sym] }.each
      print(sorted_queue)
    end

    def self.save_to(queue, headers, filename)
      CSV.open(filename, 'w') do |output|
        output << HEADERS
        queue.each do |attendee|
          attendee_output = raw(attendee)
          output << attendee_output
        end if queue
      end
    end

    def self.raw(attendee)
      [ attendee[:last_name], attendee[:first_name],
        attendee[:email_address], attendee[:zipcode],
        attendee[:city], attendee[:state],
        attendee[:street], attendee[:homephone]]
    end
  end
end