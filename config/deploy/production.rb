set :stage, :production
set :rails_env, :production
set :branch, 'master'
server '185.81.113.237', user: 'deploy', roles: %w{app db web}
