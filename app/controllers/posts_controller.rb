class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.anonymous_name =
      "#{Faker::Adjective.positive} #{Faker::Creature::Animal.name}".titleize

    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
