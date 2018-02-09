class PostController < ApplicationController

  get '/posts' do
    @posts = Post.all

    erb :'/posts/index'
  end

  get '/posts/new' do

    erb :'/posts/new'
  end

  post '/posts' do
    @post = Post.new(params[:post])
    @post.save

    redirect "/posts"
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :'/posts/show'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    binding.pry
    erb :'posts/edit'
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    # binding.pry
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy
    binding.pry
    redirect '/posts'
  end

end
