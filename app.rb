require 'sinatra/base'
require './lib/link'
require './lib/server'


class Bookmark < Sinatra::Base

  get '/' do
   erb :bookmarkie
  end

  get '/links' do

    @links = Link.all
    erb :'links/index'
  end





end
