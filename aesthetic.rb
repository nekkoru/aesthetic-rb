#aesthetics-rb
#2016 Mathilda Hartnell

#String class extension
#code originally by John Hawthorn
#https://github.com/jhawthorn/fullwidth

String.class_eval do
  def to_fullwidth
    tr(' !-~', "\u3000" + (0xFF01...0xFF5f).to_a.pack('U*'))
  end
end


def weechat_init
  Weechat.register('aesthetic', 'nekkoru', '0.0.1', 'none',
                   'add a memelicious flavour to your chat', '', '')

  Weechat.hook_modifier('input_text_for_buffer', 'parse', '')

  return Weechat::WEECHAT_RC_OK
end

def parse(data, modifier, modifier_data, line)
  return line if Weechat.string_is_command_char(line) == 1
  result = line.scan(/\{{2}.*?\}{2}/)
  result.each { |word| line.sub!(word, word.sub(/^{{(.+)}}$/, '\1').to_fullwidth) }
  return line
end

