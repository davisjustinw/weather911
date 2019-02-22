#environment file
require "open-uri"
require "nokogiri"
require "pry"
require "httparty"
require "soda/client"
require "date"
require "dotenv/load"
require "uri"
require "json"

require_relative "weather911/version"
require_relative "weather911/controller"
require_relative "weather911/api"
require_relative "weather911/day"
require_relative "weather911/prompt"
require_relative "weather911/view"
require_relative "weather911/month"
