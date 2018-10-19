# frozen_string_literal: true

# before_action :set_locale

# def set_locale
#   I18n.locale = extract_locale_from_tld || I18n.default_locale
# end

# # トップレベルドメインからロケールを取得する、なければ+nil+を返す
# # この動作をローカルPCで行なうためには、
# #   127.0.0.1 application.com
# #   127.0.0.1 application.it
# #   127.0.0.1 application.pl
# # /etc/hosts上のように記述する必要がある
# def extract_locale_from_tld
#   parsed_locale = request.host.split(".").last
#   I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
# end

class ApplicationController < ActionController::Base
end
