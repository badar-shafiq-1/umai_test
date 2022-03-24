ENV = YAML::load_file('config/application.yml')
Aws.config.update({
                    region: 'us-east-2',
                    credentials: Aws::Credentials.new(ENV['API_KEY'], ENV['API_SECRET'])
                  })
