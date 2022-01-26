Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'e9e42d4bcc59ee37de18', 'f0862a351d07e611b73da0120b7aecc79e209ce4' #Figaro.env.github_key, Figaro.env.github_secret, scope: 'user:email'
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
