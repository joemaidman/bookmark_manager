
ENV['RACK_ENV'] ||= 'development'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './lib/tag'
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

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split(',').map!(&:strip).each do |tag|
     link.tags << Tag.first_or_create(tag: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
