require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './lib/tag'
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
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(tag: params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

end
