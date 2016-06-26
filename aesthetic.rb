require 'fullwidth'

def parse(line)
  result = line.scan(/\{{2}.*?\}{2}/)
  result.each { |word| line.sub!(word, word.sub(/^{{(.+)}}$/, '\1').to_fullwidth) }
  puts(line)
end

parse("This meme is {{aesthetic}}")
  
