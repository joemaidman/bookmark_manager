class Bookmark < Sinatra::Base

  get '/links' do
    redirect 'sessions/new' if !current_user
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    redirect 'sessions/new' if !current_user
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

end
