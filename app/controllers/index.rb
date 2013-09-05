#get methods===============================

get '/' do
erb :index
end

get '/user/:user_id' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  erb :user
end

get '/logout' do
  session.clear
  redirect to '/posts'
end

#post methods ==================================

post '/login' do
  @user = User.find_by_username(params[:user][:username])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect to '/posts'
  else
    @error = "Something went wrong, please try again"
    erb :index
  end
end

post '/create' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect to '/user/:user_id'
end

