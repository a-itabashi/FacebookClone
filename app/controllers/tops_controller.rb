class TopsController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
