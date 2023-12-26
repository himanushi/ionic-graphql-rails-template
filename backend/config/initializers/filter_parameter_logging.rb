# frozen_string_literal: true

# このファイルを変更した際には、サーバーを再起動してください。

# パラメーターが部分的に一致している（例：passwはpasswordに一致）場合に、ログファイルからフィルタリングするように設定します。
# 機密情報の流出を制限するためにこれを使用します。
# サポートされている表記と動作についてはActiveSupport::ParameterFilterのドキュメントを参照してください。
Rails.application.config.filter_parameters += %i[
  passw secret token _key crypt salt certificate otp ssn
]
