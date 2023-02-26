class Post
  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console; end
  def to_strings; end

  def save
    file = File.new(file_path, 'w:UTF-8')
    to_strings.each { |item| file.puts(item) }
    file.close
  end

  def file_path
    "#{__dir__}/posts/#{@created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")}"
  end
end
