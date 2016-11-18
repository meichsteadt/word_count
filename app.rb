require('sinatra')
require('sinatra/reloader')
require('./lib/word_count.rb')
also_reload('./**/*.rb')

get('/') do
  erb(:index)
end

get('/word_count') do
  @word = params.fetch('search_word')
  @strict = params['check']
  @text = params.fetch('sentence')
  @count = @text.word_count(@word, @strict)
  erb(:word_count)
end

get('/reload') do
  erb(:index)
end
