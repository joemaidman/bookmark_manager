class Bookmark < Sinatra::Base

  get '/tags/:tag' do
     redirect 'sessions/new' if !current_user
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/tags' do
    if params[:tag] != ""
      redirect('/tags/' + params[:tag])
    else
      redirect '/links'
    end
  end

end