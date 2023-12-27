# frozen_string_literal: true

# この設定ファイルはPumaによって評価されます。ここで呼び出されるトップレベルのメソッドは、
# Pumaの設定DSLの一部です。DSLによって提供されるメソッドについての詳細は、
# https://puma.io/puma/Puma/DSL.html を参照してください。

# Pumaは、内部のスレッドプールからスレッドを使って各リクエストを処理できます。
# `threads`メソッドの設定は最小値と最大値の2つの数字を取ります。
# スレッドプールを使用するライブラリは、Pumaに指定された最大値と一致するように設定されるべきです。
# デフォルトは最小と最大で5スレッドに設定されており、これはActive Recordのデフォルトスレッドサイズに一致しています。
max_threads_count = ENV.fetch('RAILS_MAX_THREADS', 5)
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count

# 本番環境でのワーカー数はプロセッサ数と等しくするべきであると指定します。
if ENV['RAILS_ENV'] == 'production'
  require 'concurrent-ruby'
  worker_count = Integer(ENV.fetch('WEB_CONCURRENCY') { Concurrent.physical_processor_count })
  workers worker_count if worker_count > 1
end

# 開発環境においてPumaがワーカーを終了する前に待つ`worker_timeout`閾値を指定します。
worker_timeout 3600 if ENV.fetch('RAILS_ENV', 'development') == 'development'

# Pumaがリクエストを受け取るためにリッスンする`port`を指定します；デフォルトは3000です。
port ENV.fetch('PORT', 3000)

# Pumaが実行する`environment`を指定します。
environment ENV.fetch('RAILS_ENV', 'development')

# Pumaが使用する`pidfile`を指定します。
pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')

# `bin/rails restart`コマンドによってpumaを再起動できるようにします。
plugin :tmp_restart
