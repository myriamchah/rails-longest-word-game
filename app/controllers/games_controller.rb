require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

def english_word?
  response = open("https://wagon-dictionary.herokuapp.com/#{params[:word]}")
  json = JSON.parse(response.read)
  return json['found']
end

  def score
    if params[:word].chars.all? { |letter| params[:letters].downcase.split.include?(letter) }
      english_word? ? @result = 1 : @result = 2
    else
      @result = 3
    end
  end
end
