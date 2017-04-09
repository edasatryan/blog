# Base class for all the commands.
# All the data modification operations are performed by commands.
#
class ParentCommand

  # Executes this command.
  #
  # @return [Object] result of the command; can be nil.
  #
  def execute
    do_execute
  rescue StandardError => e
    Rails.logger.error("Failed to execute the command: #{e}")
    raise e
  end

  # When implemented this method should return JSON representation of this instance.
  #
  def to_json
    raise StandardError, "Not implemented!"
  end

  protected

  # When implemented should execute this command and return its result (if any).
  #
  # @return [Object] result of the command; can be nil.
  #
  def do_execute
    raise StandardError, "Not implemented!"
  end
end
