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

  def to_db_hash
    super.merge(
      {
        'url' => @url,
        'text' => @text
      }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @url = data_hash['url']
  end
end
