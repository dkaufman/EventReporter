class Text
  attr_accessor :copy

    def initialize
      self.copy =
        {:introduction =>
        "Welcome to Event Reporter\n" +
        "Type help to see a list of available commands\n" +
        "Type quit to exit the event reporter",
        :command_prompt =>
        "Enter a command --> ",
        :command_failure =>
        "Command does not exist",
        :bad_help_request =>
        "I cannot help you with this method",
        :cleared_queue =>
        "The queue has been cleared",
        :bad_sort_request =>
        "I cannot sort the queue by this method",
        :bad_find_request =>
        "I cannot search by this attribute",
        :file_load_failure =>
        "Could not load designated file",
        :file_load_success =>
        "File loaded into queue",

        :methods =>
          {"help" =>
            [ "Show all available commands",
              "Outputs a list of all available commands"
            ],
           "help <command>" =>
            [ "Shows detailed explanation for a particular command",
              nil
            ],
            "load" =>
            [ "Load a new file into the queue",
              "Loads a csv file into the queue, erasing old information.\n" +
              "You can optionally designate the file with load. <filename>\n" +
              "If no filename is given, event_attendees.csv will be used."
            ],
            "queue count" =>
            [ "Number of records in the queue.",
              "Outputs the number of records in your current queue"
            ],
            "queue clear" =>
            ["Clear the queue",
             "This will erase all data in your queue\n" +
             "You will need to load more data to do anything else."
            ],
            "queue print" =>
            ["Print the data in the queue",
             "This will output all of the attendees for the current queue\n" +
             "Optionally, you can type 'queue print by <attribute>' to sort " +
             "the queue by one of the header rows."
            ],
            "queue save to" =>
            ["Save the queue to the designated file",
             "Outputs the queue in csv format to the designated file.\n" +
             "The file is designated by queue save to <filename>"
            ],
            "find" =>
            ["Finds all records that fit the criteria",
             "The format is find <attribute> <criteria>.\n" +
             "The command will filter the queue such that only records " +
             "where the desigated attribute (i.e. zipcode) matches the " +
             "designated criteria (i.e. 53211) are kept in the queue."
            ],
            "quit" =>
            ["Quits the program",
             "Exits the program"]
          }
        }
  end
end