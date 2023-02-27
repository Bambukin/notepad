class Link < Post
  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts 'Адрес ссылки:'
    @url = $stdin.gets.chomp

    puts 'Что за ссылка?'
    @text = $stdin.gets.chomp
  end

  def to_strings
    time_string = @created_at.strftime('Создано: %Y.%m.%d, %H:%M:%S')

    [@url, @text, time_string]
  end
end
