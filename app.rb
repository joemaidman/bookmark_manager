
ENV['RACK_ENV'] ||= 'development'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require './lib/user'
require './lib/tag'
require './lib/link'
require './lib/server'
require 'sinatra/flash'


class Bookmark < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
end

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

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
  @user = User.create(email: params[:email], 
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/links')
  else
    flash.now[:notice] = "Password and confirmation password did not match!"
    erb :'users/new'
  end
end

end
