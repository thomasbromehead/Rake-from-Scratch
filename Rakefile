task :hello do 
  # puts "I am being run when .call is invoked!"
  puts "hello"
end

task :world do
  puts "world"
end

task :hello_world, [:hello, :world] do |dependencies|
   puts "Called the following tasks as dependencies: #{dependencies.join(', ')}"
end

