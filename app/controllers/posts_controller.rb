class PostsController < ApplicationController
  # 一覧と詳細だけはログインなしでOK
  allow_unauthenticated_access only: [ :index, :show ]

  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_post, only: [ :edit, :update, :destroy ]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    # @post は before_action の set_post で取得済み
  end

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @post は set_post で取得済み
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました", status: :see_other
  end

  private

  # IDから投稿を探す共通メソッド
  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_post
    unless @post.user == Current.user
      redirect_to posts_path, alert: "権限がありません"
    end
  end

  def post_params
    params.expect(post: [ :title, :content, :image ])
  end
end
