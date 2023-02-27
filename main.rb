require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/task'
require_relative 'lib/link'

puts 'Привет, я твой блокнот'
puts 'Что хотите записать в блокнот?'

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size
  choices.each.with_index(1) do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = $stdin.gets.to_i - 1
end

entry = Post.create(choice)

entry.read_from_console

entry.save

puts 'Ура, все ок)'
