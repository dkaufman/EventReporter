$LOAD_PATH << './'
require 'attendee.rb'
require 'text.rb'
require 'search.rb'
require 'load.rb'
require 'queue.rb'
require 'cane'
require 'ruby-debug'

module EventManagement
  class EventReporter

    CSV_OPTIONS = { :headers => true,
                    :header_converters => :symbol,
                    :return_headers => true}

    attr_accessor :queue, :headers, :copy, :file

    def initialize
      self.queue = []
      self.copy = Text.new.copy
    end

    def run
      puts copy[:introduction]
      command = ""

      while command != 'quit'
        printf copy[:command_prompt]
        input = gets.chomp
        command, subcommand = process_input(input)
        execute_command(command, subcommand)
      end
    end

    private

    def execute_command(command, subcommand)
      case command
        when 'load' then load(command, subcommand)
        when 'queue' then queue_up(subcommand)
        when 'find' then find(subcommand)
        when 'add' then add(subcommand)
        when 'subtract' then subtract(subcommand)
        when 'help' then help(subcommand)
        when 'quit' then puts "Goodbye"
        else
          puts copy[:command_failure]
      end
    end

    def process_input(input)
      parts = input.split
      command = parts[0]
      subcommand = parts[1..-1].join(" ")
      return [command, subcommand]
    end

    def help(subcommand)
      if copy[:methods].keys.include?(subcommand)
        print_method_description(subcommand)
      elsif !subcommand.empty?
        puts copy[:bad_help_request]
      else
        print_all_methods
      end
    end

    def load(command, subcommand)
      self.file, self.headers = Load.new(subcommand, CSV_OPTIONS)
    end

    def queue_up(subcommand)
      self.queue = Queue.functions(queue, headers, subcommand)
    end

    def find(subcommand)
      self.queue = Search.for(file, queue, headers, subcommand)
    end

    def subtract(subcommand)
      self.queue = Search.subtract(file, queue, headers, subcommand)
    end

    def add(subcommand)
      self.queue = Search.add(file, queue, headers, subcommand)
    end

    def print_all_methods
      copy[:methods].each do |method, description|
        puts "#{method} --> #{description[0]}"
      end
    end

    def print_method_description(method)
      puts "#{method} --> #{copy[:methods][method][1]}"
    end
  end
end

reporter = EventManagement::EventReporter.new
reporter.run


