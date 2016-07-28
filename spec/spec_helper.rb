$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fub_client'
require 'pry'

Dir["#{FubClient.root}/spec/support/**/*.rb"].each { |f| require f }
