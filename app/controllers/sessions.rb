class Bookmark < Sinatra::Base

get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user 
      session[:user_id] = user.id
      redirect to('/links')
    else
      flash.now[:errors] = ['Invalid email address or password']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'You have signed-out.'
    redirect to '/links'
end

end