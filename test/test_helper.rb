# typed: strict
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'relative_time'
require "simplecov"
SimpleCov.start

require 'minitest/autorun'
