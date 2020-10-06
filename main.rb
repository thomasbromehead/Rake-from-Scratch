TASKS = {}

class Task
  attr_reader :dependencies, :action
  def initialize(name, dependencies, action)
    @name = name
    @action = action
    @dependencies = dependencies
  end

  def call
    # Instance variables are nil by default
    return if @already_run
    p action
    @action.call
    @already_run = true
  end
end

# The task method will be called when loading the Rakefile so needs to be defined
def task(name, dependencies = [], &block)
  yield dependencies if !dependencies.empty?
  command = Task.new(name, dependencies, block)
  TASKS[name.to_s] = command
end

# Load doesn't require a .rb extension and will run the code
load "./Rakefile"

ARGV.each do |command|
  if TASKS.has_key?(command)
    deps = TASKS[command].dependencies
    if !deps.empty?
      deps.each do |dep|
        TASKS[dep.to_s].action.call
      end
    end
    TASKS[command].call
  else
    puts "Sorry there is no task defined with name #{command.name}"
  end
end

