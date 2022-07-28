require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Fera < OmniAuth::Strategies::OAuth2
      option :client_options,
             site: ENV['FERA_APP_URL'].presence || ENV['FERA_PROVIDER_URL'].presence || 'https://app.fera.ai'

      option :setup, proc { |env|
        request = Rack::Request.new(env)
        allowed_get_params = request.GET.slice('shop', 'store', 'id', 'public_key', 'store_pk', 'store_public_key', 'pk', 'store_id', 'shop_id')
        request.env['omniauth.params'] = env['omniauth.params'].to_h.merge(allowed_get_params)
      }

      def callback_url
        options[:callback_url] || full_host + script_name + callback_path
      end
      
      def authorize_params
        super.merge(request.GET.slice('shop', 'store', 'id', 'public_key', 'store_pk', 'store_public_key', 'pk', 'store_id', 'shop_id'))
      end
    end
  end
end
