require('rspec')
require('word_count')

describe('String#word_count') do
  it('will count a word if it matches') do
    expect('cat'.word_count('cat', false)).to(eq(1))
  end
  it('will count a word if it matches in strict mode') do
    expect('cat'.word_count('cat', ['on'])).to(eq(1))
  end
  it('will count a word if it matches any of the words in the sentence') do
    expect('a cat went to the cathedral with Cat'.word_count('cat', ['off'])).to(eq(3))
  end
  it('will count a word if it matches completely, no partial matches') do
    expect('a cat went to the cathedral'.word_count('cat', ['on'])).to(eq(1))
  end
  it('will count a word if it matches completely, no partial matches at end of sentence') do
    expect('a cat went to the cathedral with Cat'.word_count('cat', ['on'])).to(eq(1))
  end
end
