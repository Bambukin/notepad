class Post
  def self.post_types
    [Memo, Link, Task]
  end

  def self.create(type_index)
    post_types[type_index].new
  end

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
    @created_at.strftime("#{__dir__}/../posts/#{self.class}_%Y-%m-%d_%H-%M-%S.txt")
  end
end
