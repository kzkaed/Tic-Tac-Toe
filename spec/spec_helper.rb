$: << File.expand_path(File.dirname(__FILE__)) + '/../'
$: << File.expand_path(File.dirname(__FILE__) + "/../lib")


require 'rspec'
require 'stringio'

Dir["./lib/*.rb"].each { |file| require file }