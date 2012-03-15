class Text
  attr_accessor :introduction, :command_prompt, :command_failure,
                :bad_help_request, :cleared_queue, :bad_sort_request,
                :bad_find_request, :file_load_failure, :file_load_success
  def introduction
    "Welcome to Event Reporter\n" +
    "Type help to see a list of available commands\n" +
    "Type quit to exit the event reporter"
  end

  def command_prompt
    "Enter a command --> "
  end

  def command_failure
    "Command does not exist"
  end
end