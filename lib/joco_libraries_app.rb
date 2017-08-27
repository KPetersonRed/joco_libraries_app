#This file acts as my environment. Single file to require which will then require all other dependencies.
require 'open-uri' #because doing an 'open' on url jocolibraries.org
require 'nokogiri'
require 'pry'

require_relative "joco_libraries_app/version"
require_relative './joco_libraries_app/cli'
require_relative './joco_libraries_app/libraries'
