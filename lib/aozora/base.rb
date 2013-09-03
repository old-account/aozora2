class Aozora
  def initialize(title=:kokoro)
    dir = File.expand_path(File.dirname(__FILE__))
    @path = dir+"/../data/fmt/#{title}.txt"
  end
  
  def text(length=100,option={})
    text = read(length)
  end

  private

  def read(length)
    File.open(@path) do |file|
      text = ""
      while text.length < length
        text += file.readline.chomp
      end
      return text[0...length]
    end
  end
end
