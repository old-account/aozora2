# -*- coding: utf-8 -*-

# String#stripで全角スペースも削除するよう変更
class String
  alias :nomal_strip :strip

  def strip
    nomal_strip.gsub(/^[　|\s]+|[　|\s]+$/,"")
  end

  def to_plain
    # ルビを削除
    without_rubi = gsub(/《.*?》/,"")
    # 青空文庫の記号"｜"も削除
    without_rubi.gsub(/｜/,"")
  end
end

first_line_reg = /私《わたくし》はその人を常に先生と呼んでいた。だからここでも/
last_line_reg  = /られた私の秘密として、すべてを腹の中にしまっておいて下さい。」/
annotation_start = "［＃"
annotation_end   = "］"

File.open('kokoro_org.txt') do |f_org|

  # 本文の一行目まで読み飛ばす
  loop do
    line = f_org.readline.strip
    if line =~ first_line_reg
      File.open('kokoro_fmt.txt','w') { |f_fmt| f_fmt.puts(line.to_plain) }
      break
    end
  end
  
  File.open('kokoro_fmt.txt','a') do |f_fmt|
    loop do
      line = f_org.readline.strip
      next if line == ""
      next if line[0..1] == annotation_start and line[-1] == annotation_end
      f_fmt.puts(line.to_plain)
      break if line =~ last_line_reg
    end
  end
end
