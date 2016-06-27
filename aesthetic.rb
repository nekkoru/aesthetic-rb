require 'fullwidth'

def weechat_init
  Weechat.register('aesthetic', 'nekkoru', '0.0.1', 'none',
                   'add a memelicious flavour to your chat', '', '')

  Weechat.hook_modifier('input_text_for_buffer', 'parse', '')

  return Weechat::WEECHAT_RC_OK
end

def parse(line)
  result = line.scan(/\{{2}.*?\}{2}/)
  result.each { |word| line.sub!(word, word.sub(/^{{(.+)}}$/, '\1').to_fullwidth) }
  return line
end

parse("This meme is {{aesthetic}}")
  
