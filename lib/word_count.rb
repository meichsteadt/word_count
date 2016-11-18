class String
  define_method(:word_count) do |match_word, strict|
    strict == ["on"] ? (return self.scan(/(\b#{match_word}\b)/).length) : (return self.downcase().scan(match_word).length)
  end
end
