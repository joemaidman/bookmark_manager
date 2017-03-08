require 'sinatra/base'
require './lib/link'
require './lib/server'

ENV['RACK_ENV'] ||= 'development'


class Bookmark < Sinatra::Base

  get '/' do
   erb :bookmarkie
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end




end
