$: << File.expand_path(File.dirname(__FILE__)) + '/../'
$: << File.expand_path(File.dirname(__FILE__) + "/../lib")


require 'rspec'


Dir["./lib/*.rb"].each { |file| require file }