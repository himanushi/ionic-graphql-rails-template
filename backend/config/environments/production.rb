# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # ここで指定された設定はconfig/application.rbの設定より優先されます。

  # リクエスト間でコードはリロードされません。
  config.enable_reloading = false

  # 起動時にコードを事前読み込みします。これにより、Railsとアプリケーションのほとんどが
  # メモリ内に読み込まれ、スレッド型のWebサーバーやコピー時に書き込みを行うサーバーのパフォーマンスが向上します。
  # Rakeタスクはパフォーマンスのために自動的にこのオプションを無視します。
  config.eager_load = true

  # 完全なエラーレポートは無効化され、キャッシングがオンになります。
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # ENV["RAILS_MASTER_KEY"]、config/master.key、またはconfig/credentials/production.keyなどの環境
  # キーでマスターキーが利用可能になっていることを確認します。このキーは、資格情報（および他の暗号化されたファイル）の
  # 復号化に使用されます。
  # config.require_master_key = true

  # `public/`からの静的ファイルの提供を無効にし、NGINX/Apacheに依存します。
  # config.public_file_server.enabled = false

  # アセットサーバーから画像、スタイルシート、JavaScriptの提供を有効にします。
  # config.asset_host = "http://assets.example.com"

  # サーバーがファイルを送信する際に使用するヘッダーを指定します。
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # Apache用
  # config.action_dispatch.x_sendfile_header = "X-Accel-Redirect" # NGINX用

  # アップロードされたファイルをローカルファイルシステムに保存します（オプションはconfig/storage.ymlを参照）。
  # config.active_storage.service = :local

  # アプリへのすべてのアクセスがSSL終端リバースプロキシを通じて行われていると想定します。
  # config.force_sslと組み合わせてStrict-Transport-Securityとセキュアクッキーを使用することができます。
  # config.assume_ssl = true

  # SSL経由でのアプリへのすべてのアクセスを強制し、Strict-Transport-Securityを使用し、セキュアクッキーを使用します。
  config.force_ssl = true

  # デフォルトではSTDOUTにログを記録します。
  config.logger = ActiveSupport::Logger.new($stdout)
                                       .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
                                       .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # すべてのログ行の先頭に以下のタグを付けます。
  config.log_tags = [:request_id]

  # Infoレベルのログには、システム運用に関する一般的で有用な情報が含まれますが、
  # 個人情報（PII）の不注意な公開を避けるために多くの情報の記録を避けます。すべてを記録したい場合は、
  # レベルを"debug"に設定します。
  config.log_level = ENV.fetch('RAILS_LOG_LEVEL', 'info')

  # 本番環境では異なるキャッシュストアを使用します。
  # config.cache_store = :mem_cache_store

  # Active Jobに実際のキューイングバックエンドを使用します（環境ごとに別のキューを設定）。
  # config.active_job.queue_adapter = :resque
  # config.active_job.queue_name_prefix = "backend_production"

  # I18nのロケールフォールバックを有効にします（翻訳が見つからない場合に任意のロケールの検索が
  # I18n.default_localeにフォールバックするようにします）。
  config.i18n.fallbacks = true

  # すべての非推奨警告をログに記録しません。
  config.active_support.report_deprecations = false

  # マイグレーション後にスキーマをダンプしません。
  config.active_record.dump_schema_after_migration = false

  # DNSリバインディング保護およびその他の`Host`ヘッダ攻撃を有効にします。
  # config.hosts = [
  #   "example.com",     # example.comからのリクエストを許可
  #   /.*\.example\.com/ # `www.example.com`のようなサブドメインからのリクエストを許可
  # ]
  # デフォルトのヘルスチェックエンドポイントのためにDNSリバインディング保護をスキップします。
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }
end
