require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0..9).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    word = params[:question]
    letters = params[:letters].split('')
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    language = open(url).read
    lang = JSON.parse(language)
    @error = "#{word} isn't a word dum dum." if lang['found'] == false
    @winner = 'good job' if lang['found'] == true && check(letters, word) == true
    @not = 'Cheater, false letters' if check(letters, word) == false
  end

  def check(grid, word)
    word = word.split('')
    word.all? do |letter|
      word.count(letter) <= grid.count(letter)
    end
  end
end
