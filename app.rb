require 'sinatra/base'
require './lib/link'
require './lib/server'

ENV['RACK_ENV'] ||= 'development'
#ENV['DATABASE_URL'] = "postgres://fqfdmrjejzykxg:841cf93393aeb1b90d90f6f53109928f2cce3dfbfb0c703a1645569d83604c7c@ec2-54-235-92-236.compute-1.amazonaws.com:5432/d5e12dm1afqi8i"

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
