class BlogsController < ApplicationController
  before_action :blog_new, only: [:create, :confirm]
  before_action :set_blog, only: [:edit, :update, :destroy]

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def confirm
    render 'new' if @blog.invalid?
  end

  def create
    if @blog.save
      flash[:success] = "投稿が完了しました"
      redirect_to root_path
    else
      flash.now[:danger] = "入力内容に誤りがあります。もう一度ご確認ください。"
      render 'new'
    end
  end

  def show
    @blogs = Blog.where(id: current_user.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    flash.now[:info] = "投稿を削除しました"
    redirect_to root_path
  end

  private
  
  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end

  def blog_new
    @blog = current_user.blogs.build(blog_params)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
