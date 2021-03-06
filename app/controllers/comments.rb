get '/posts/:post_id/comments/new' do
  @post = Post.find_by(id: params[:post_id])
  erb :'comments/new'
end

post '/posts/:post_id/comments' do
  @post = Post.find_by(id: params[:post_id])
  @comment = @post.comments.new(params[:comment])
  if @comment.save
    redirect "/posts/#{@post.id}/comments"
  else
    erb :'comments/new' #show new comments view again(potentially displaying errors)
  end
end

get '/posts/:post_id/comments/:id/edit' do
  @post = Post.find_by(id: params[:post_id])
  @comment = @post.comments.find_by(id: params[:id])
  erb :'comments/edit'
end


put '/posts/:post_id/comments/:id' do
  @post = Post.find_by(id: params[:post_id])
  @comment = @post.comments.find_by(id: params[:id])
  if @comment.update_attributes(params[:comment])
    redirect "/posts/#{@post.id}/comments"
  else
    erb :'comments/edit' #show edit comments view again(potentially displaying errors)
  end

end

delete '/posts/:post_id/comments/:id' do
  @post = Post.find_by(id: params[:post_id])
  @comment = @post.comments.find_by(id: params[:id])
  @comment.destroy
  redirect "/posts/#{@post.id}/comments"
end
