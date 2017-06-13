# Libs
require 'base64'
require 'singleton'
require 'faraday'
require 'her'
require 'facets/string/snakecase'

# App
require "fub_client/version"
require "fub_client/client"
require "fub_client/middleware"
require "fub_client/resource"
# App Models
require "fub_client/event"
require "fub_client/person"
require "fub_client/note"
require "fub_client/call"
require "fub_client/user"
require "fub_client/smart_list"
require "fub_client/email_template"
require "fub_client/action_plan"
require "fub_client/em_event"
require "fub_client/custom_field"
require "fub_client/deal"

module FubClient
  def self.root
    File.expand_path '../..', __FILE__
  end  
end
