require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Mojepanstwo < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site           => "http://mojepanstwo.pl",
        :authorize_url  => "/oauth/authorize",
        :token_url      => "/oauth/access_token"
      }
      option :token_params, {
        :parse          => :json
      }

      uid do
        raw_info['id']
      end

      info do
        {
          :name         => [raw_info['name'], raw_info['lastname']].join(" "),,
          :email 	=> raw_info['email'],
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
	@raw_info ||= access_token.get('/oauth/userinfo', parse: :json).parsed
        #access_token.options[:mode] = :query
        #access_token.options[:param_name] = 'access_token'
        #@uid ||= access_token.get('/2/account/get_uid.json').parsed["uid"]
        #@raw_info ||= access_token.get("/2/users/show.json", :params => {:uid => @uid}).parsed
      end

      def find_image
        raw_info[%w(avatar_hd avatar_large profile_image_url).find { |e| raw_info[e].present? }]
      end
            
    end
  end
end

OmniAuth.config.add_camelization "mojepanstwo", "Mojepanstwo"
