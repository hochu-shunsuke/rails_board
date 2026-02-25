Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [ :create, :destroy ]
  end

  # トップページ（http://localhost:3000/）にアクセスしたときに、投稿一覧を表示する
  root "posts#index"

  # ヘルスチェック用の設定（そのまま残してOKです）
  get "up" => "rails/health#show", as: :rails_health_check
end
