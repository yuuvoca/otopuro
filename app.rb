require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'sinatra/activerecord'
require './models'

enable :sessions

get '/' do
erb :index
end

post '/answers' do
    Answer.create(
    name: params[:name],
    age: params[:age],
    gender: params[:gender],
    grade: params[:grade],
    email: params[:email],
    password: params[:password],
    date: params[:date],
    content: params[:content]
    )
    redirect '/'
end

get '/answers' do
    @answer = Answer.all
    erb :answers
end

get '/signin' do
    erb :sign_in
end

get '/signup' do
    erb :sign_up
end

get '/information' do
    erb :information
end

post '/signin' do
    user = User.find_by(mail: params[:mail])
    if user && user.authenticate(params[:password])
        session[:user] = user.id
    end
    redirect '/'
end

post '/signup' do
    @user = User.create(mail:params[:mail],password:params[:password],password_confirmation:params[:password_confirmation])
    if @user.persisted?
        session[:user] = @user.id
    end
    redirect '/'
end

get '/signout' do
    session[:user] = nil
    redirect '/'
end

post '/posts' do
    current_user.tasks.create(title: params[:title])
    redirect '/'
end