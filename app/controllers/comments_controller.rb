class CommentsController < ApplicationController
  def new

  end

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = Comment.new(body: params[:comment][:body], entry_id: params[:entry_id])
    if @comment.save
      @blog = Blog.find(params[:blog_id])
      UserMailer.with(entry: @entry, blog: @blog, comment: @comment).comment_mailer.deliver_later
    end
    redirect_to blog_entry_path(params[:blog_id], params[:entry_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to blog_entry_path(params[:blog_id], params[:entry_id])
  end

  def approve
    @comment = Comment.find(params[:id])
    @comment.update_attributes(status:"approved")
    redirect_to blog_entry_path(params[:blog_id], params[:entry_id])
  end
end
