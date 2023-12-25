# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # ここで指定された設定はconfig/application.rbの設定より優先されます。

  # 開発環境では、アプリケーションのコードが変更されるたびにリロードされます。
  # これは応答時間を遅くしますが、コード変更時にウェブサーバーを再起動する必要がないため、開発には最適です。
  config.enable_reloading = true

  # 起動時にコードを事前読み込みしない。
  config.eager_load = false

  # 完全なエラーレポートを表示。
  config.consider_all_requests_local = true

  # サーバータイミングを有効にする。
  config.server_timing = true

  # キャッシングの有効/無効を設定。デフォルトではキャッシングは無効。
  # rails dev:cacheを実行してキャッシングを切り替えます。
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # アップロードされたファイルをローカルファイルシステムに保存（オプションはconfig/storage.ymlを参照）。
  config.active_storage.service = :local

  # 非推奨通知をRailsロガーに出力。
  config.active_support.deprecation = :log

  # 許可されていない非推奨に対して例外を発生。
  config.active_support.disallowed_deprecation = :raise

  # Active Supportにどの非推奨メッセージを禁止するか指示。
  config.active_support.disallowed_deprecation_warnings = []

  # 未実行のマイグレーションがある場合にページロード時にエラーを発生。
  config.active_record.migration_error = :page_load

  # ログ内でデータベースクエリをトリガーしたコードをハイライト。
  config.active_record.verbose_query_logs = true

  # バックグラウンドジョブをキューに入れたコードをログでハイライト。
  config.active_job.verbose_enqueue_logs = true

  # 不足している翻訳に対してエラーを発生。
  # config.i18n.raise_on_missing_translations = true

  # レンダリングされたビューにファイル名を注釈。
  # config.action_view.annotate_rendered_view_with_filenames = true

  # before_actionのonly/exceptオプションが存在しないアクションを参照した場合にエラーを発生。
  config.action_controller.raise_on_missing_callback_actions = true
end
