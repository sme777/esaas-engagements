require 'omniauth-oauth2'

OmniAuth::Strategies::GitHub < OmniAuth::Strategies::OAuth2 do
  def raw_info
    access_token.options[:mode] = :header
    @raw_info ||= access_token.get('user').parsed
  end
end
