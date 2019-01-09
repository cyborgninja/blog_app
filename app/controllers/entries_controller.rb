class EntriesController < ApplicationController
  def show
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.find_by(id: params[:id], blog_id: params[:blog_id])
    if @entry.nil?
      redirect_to blog_path(params[:blog_id])
    end
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.new(blog_id: params[:blog_id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def create
    Entry.create(title: params[:entry][:title], body:params[:entry][:body], blog_id: params[:blog_id])
    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.delete
    redirect_to blog_path(params[:blog_id])
  end
end
