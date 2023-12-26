# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# 必要なフレームワークを選択してください:
require 'active_model/railtie'
# require 'active_job/railtie'
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
# require "action_mailer/railtie"
# require 'action_mailbox/engine'
# require 'action_text/engine'
# require 'action_view/railtie'
# require "action_cable/engine"
require 'rails/test_unit/railtie'

# Gemfileにリストされているジェムを必要に応じて要求します。これには、
# :test、:development、または:productionに制限されたジェムも含まれます。
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # 元々生成されたRailsバージョンのデフォルト設定を初期化します。
    config.load_defaults 7.1

    # `lib`サブディレクトリのうち、`.rb`ファイルを含まないものや、リロードやイーガーロードを
    # 行うべきではないものを`ignore`リストに追加してください。
    # 一般的なものには`templates`、`generators`、または`middleware`などがあります。
    config.autoload_lib(ignore: %w[assets tasks])

    # アプリケーション、エンジン、およびレイルタイの設定はここに配置します。
    #
    # これらの設定は、後で処理されるconfig/environments内のファイルを使用して、
    # 特定の環境で上書きすることができます。
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
