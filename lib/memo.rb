class Memo < Post
  def read_from_console
    puts 'Новая заметка (все, что пишете до строчки "end"):'

    @text = []
    line = nil

    until line == 'end'
      line = $stdin.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = @created_at.strftime("Создано: %Y.%m.%d, %H:%M:%S \n\r")

    @text.unshift(time_string)
  end
end
