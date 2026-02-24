Rails.application.routes.draw do
  # 掲示板の基本機能（一覧、詳細、保存、更新、削除など）をまとめて設定
  resources :posts

  # トップページ（http://localhost:3000/）にアクセスしたときに、投稿一覧を表示する
  root "posts#index"

  # ヘルスチェック用の設定（そのまま残してOKです）
  get "up" => "rails/health#show", as: :rails_health_check
end
