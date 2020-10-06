TASKS = {}

ARGV.each do |command|
  p command
end

class Task
  def initialize(name, action)
    @name = name
    @action = action
  end
end


def task(name, &block)

end