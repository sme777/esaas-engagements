Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], {
    # From: https://github.com/mkdynamic/omniauth-facebook/pull/174#issuecomment-300299724
    # To fix: https://github.com/mkdynamic/omniauth-facebook/issues/284
    token_params: { parse: :json },
 } #Figaro.env.github_key, Figaro.env.github_secret, scope: 'user:email'
  unless Rails.env.production?
    OmniAuth.config.test_mode = true
    user = YAML.load(File.read "#{Rails.root}/db/github_mock_login.yml")[Rails.env]
    OmniAuth.config.add_mock(:github,
                             {
                                 :uid => '12345',
                                 :info => {
                                     :name => user['name'],
                                     :nickname => user['github_uid'],
                                     :email => user['email'],
                                     :type_user => user['user_type']
                                 }
                             })
  end
end
