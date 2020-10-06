TASKS = {}

class Task
  def initialize(name, action)
    @name = name
    @action = action
  end

  def call
    # Instance variables are nil by default
    return if @already_run
    action.call
    @already_run = true
  end
end

# The task method will be called when loading the Rakefile so needs to be defined
def task(name, &block)
  p name
  p block
  command = Task.new(name, block)
  TASKS[name.to_s] = command
end

load "./Rakefile"

ARGV.each do |command|
  TASKS[command].call
end
