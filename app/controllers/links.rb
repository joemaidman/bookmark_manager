class Bookmark < Sinatra::Base

  get '/links' do
    redirect 'sessions/new' if !current_user
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    redirect 'sessions/new' if !current_user
    @link = Link.new
    erb :'links/new'
  end

  post '/links' do
    @link = Link.create(title: params[:title], url: params[:url])
    params[:tags].split(',').map!(&:strip).each do |tag|
    @link.tags << Tag.first_or_create(tag: tag)
    end
    if @link.save
      session[:draft_title] = @link.title
      session[:draft_url] = @link.url
      redirect to('/links')
    else
      flash.now[:errors] = @link.errors.full_messages
      erb :'links/new'
    end
  end

  delete '/links' do
    link = Link.get(params[:id])
    link.destroy
    redirect '/links'
  end

end
