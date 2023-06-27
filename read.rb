require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/task'
require_relative 'lib/link'
require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'какой тип постов показать (Memo, Task, Link)') { |o| options[:type] = o }
  opt.on('--id POST_ID', 'если задан id – показать подробно только этот пост') { |o| options[:id] = o }
  opt.on('--limit NUMBER', 'сколько последних постов показать (по умолчанию все)') { |o| options[:limit] = o }
end.parse!

if options[:id].nil?
  begin
    result = Post.find_all(options[:limit], options[:type])
  rescue SQLite3::SQLException => e
    puts "Ошибка, #{e.message}"
    exit
  end
  print '| id                 '
  print '| @type              '
  print '| @created_at        '
  print '| @text              '
  print '| @url               '
  print '| @due_date          '
  print '|'

  result&.each do |row|
    puts
    row.each do |element|
      element_text = "| #{element.to_s.delete("\n")[0..17]}"
      element_text << ' ' * (21 - element_text.size)
      print element_text
    end

    print '|'
  end
else
  begin
    result = Post.find_by_id(options[:id])
  rescue SQLite3::SQLException => e
    puts "Ошибка, #{e.message}"
    exit
  end
  exit if result.nil?
  puts "Запись #{result.class.name}, id = #{options[:id]}"

  result.to_strings.each { |line| puts line }
end
