# -*- coding: utf-8 -*-

class Aozora
  def initialize(title=:kokoro)
    @title = title
  end
  
  def text(length=100,options={})
    text = read(length)

    case options[:alpha]
      when "full"
      when "half"
      when "none"
      when nil
    end

    case options[:digit]
      when "full"
      when "half"
      when "none"
      when nil
    end

    case options[:sign]
      when "full"
      when "half"
      when "none"
      when nil
    end

    if options[:end_dots]
      text += "…"
    end

    if options[:paragraph]
      if options[:length_paragraph]
      end

      if options[:blank_line]
      end

      if options[:space_head]
      end
    end
    return text
  end

  private

  def read(length)
    dir = File.expand_path(File.dirname(__FILE__))
    filename = dir+"/../data/fmt/#{@title}.txt"
    File.open(filename) do |f|
      text = ""
      while text.size < length
        text += f.readline.chomp
      end
      return text[0...length]
    end
  end
end
