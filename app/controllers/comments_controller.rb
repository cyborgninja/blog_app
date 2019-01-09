class CommentsController < ApplicationController
  def new

  end

  def create
    @entry = Entry.find(params[:entry_id])
    Comment.create(entry_id: params[:entry_id])
    redirect_to blog_entry_path(@entry.blog.id, @entry.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    redirect_to blog_entry_path(@comment.entry.blog.id, @comment.entry.id)
  end
end
