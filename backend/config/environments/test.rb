# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

# テスト環境は、アプリケーションのテストスイートを実行するために専用に使用されます。
# それ以外で作業する必要はありません。テストデータベースはテストスイートの「作業スペース」であり、
# テスト実行の間に消去され、再作成されることを覚えておいてください。そこにあるデータに依存しないでください！

Rails.application.configure do
  # ここで指定された設定はconfig/application.rbの設定より優先されます。

  # テスト実行中はファイル監視されず、リロードは不要です。
  config.enable_reloading = false

  # イーガーロードはアプリケーション全体をロードします。ローカルで単一のテストを実行する場合、
  # 通常は必要なく、テストスイートの速度を遅くすることがあります。ただし、コードをデプロイする前に
  # イーガーロードが正しく動作していることを確認するため、継続的インテグレーションシステムでは有効にすることを推奨します。
  config.eager_load = ENV['CI'].present?

  # パフォーマンスのためにキャッシュコントロールでテスト用のパブリックファイルサーバーを設定。
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # 完全なエラーレポートを表示し、キャッシングを無効にします。
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # 救済可能な例外に対して例外テンプレートをレンダリングし、他の例外に対しては例外を発生させます。
  config.action_dispatch.show_exceptions = :rescuable

  # テスト環境ではリクエスト偽造保護を無効にします。
  config.action_controller.allow_forgery_protection = false

  # アップロードされたファイルを一時ディレクトリのローカルファイルシステムに保存します。
  config.active_storage.service = :test

  # 非推奨通知を標準エラー出力に出力します。
  config.active_support.deprecation = :stderr

  # 許可されていない非推奨に対して例外を発生させます。
  config.active_support.disallowed_deprecation = :raise

  # Active Supportにどの非推奨メッセージを禁止するか指示します。
  config.active_support.disallowed_deprecation_warnings = []

  # 不足している翻訳に対してエラーを発生させます。
  # config.i18n.raise_on_missing_translations = true

  # レンダリングされたビューにファイル名を注釈します。
  # config.action_view.annotate_rendered_view_with_filenames = true

  # before_actionのonly/exceptオプションが存在しないアクションを参照した場合にエラーを発生させます。
  config.action_controller.raise_on_missing_callback_actions = true
end
