require 'json'
require 'net/http' #to make a GET request
require 'open-uri' #to fetch the data from the URL to then be parsed by JSON

class LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end

  def show
  end

  def new
  end

  def create
  end

  def update
        @language = Language.find_by(name: params[:language])
        
        puts "language COUNT---- #{@language.count}"
        @language.count += 1
        @language.update(count: @language.count)
        puts "language---- #{@language.inspect}"
        puts "language COUNT1---- #{@language.count}"
      
        @language_data = {"language" => params[:language]}
        uri = URI('http://localhost:7777/')
        res = Net::HTTP.post_form(uri, @language_data)
        render text: res
        puts res.body
  end

  def edit
  end

  def destroy
  end

end
