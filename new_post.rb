require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/task'
require_relative 'lib/link'

puts 'Привет, я твой блокнот! Версия " + Sqlite"'
puts 'Что хотите записать в блокнот?'

choices = Post.post_types.keys

choice = -1

until choice >= 0 && choice < choices.size
  choices.each.with_index(1) do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = $stdin.gets.to_i - 1
end

entry = Post.create(choices[choice])

entry.read_from_console

begin
  id = entry.save_to_db
rescue SQLite3::SQLException => e
  puts "Ошибка, #{e.message}"
  exit
end

puts "Ура, все ок, id = #{id}"
