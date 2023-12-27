# frozen_string_literal: true

Rails.application.routes.draw do
  # https://guides.rubyonrails.org/routing.html のDSLに従って、アプリケーションのルートを定義してください。

  # 例外なしでアプリが起動した場合に200を返す、/upでヘルスステータスを表示します。
  # ロードバランサーやアップタイムモニターがアプリが動作していることを確認するために使用できます。
  get 'up' => 'rails/health#show', as: :rails_health_check

  # ルートパスルート（"/"）を定義します。
  # root "posts#index"
end
