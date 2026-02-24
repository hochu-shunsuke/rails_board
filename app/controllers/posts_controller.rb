class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  # GET /posts/new (新規投稿画面を表示するだけ)
  def new
    @post = Post.new # 空っぽのモデルを作るだけ
  end

  # POST /posts (投稿ボタンが押されたときにここが動いて保存する)
  def create
    @post = Post.new(post_params) # 送られてきたデータをセット

    if @post.save
      redirect_to posts_path, notice: "投稿が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def post_params
    # Rails 8系の新しい書き方。require(:post).permit(...) と同じ意味です。
    params.expect(post: [ :title, :content ])
  end
end
