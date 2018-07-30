class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  @blog = Blog.new(blog_params)
     if @blog.save
       redirect_to blogs_path, notice: "ブログを作成しました！"
     else
       render 'new'
     end
   end

  def create
    Blog.create(blog_params)
    redirect_to new_blog_path
  end

  def show
    @blog = Blog.find(params[:id])
 end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end