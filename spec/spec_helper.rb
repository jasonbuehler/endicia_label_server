require "codeclimate-test-reporter"
SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter::new [
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
end

path = File.expand_path("../../", __FILE__)
require "#{path}/lib/endicia_label_server.rb"
require 'rspec/xsd'

Dir["#{path}/spec/support/*.rb"].each {|file| require file}

ENV['ENDICIA_ACCOUNT_ID'] = '' unless ENV.key? 'ENDICIA_ACCOUNT_ID'
ENV['ENDICIA_PASS_PHRASE'] = '' unless ENV.key? 'ENDICIA_PASS_PHRASE'
ENV['ENDICIA_TOKEN'] = '' unless ENV.key? 'ENDICIA_TOKEN'
ENV['ENDICIA_REQUESTER_ID'] = '' unless ENV.key? 'ENDICIA_REQUESTER_ID'

RSpec.configure do |c|
  c.mock_with :rspec
  c.include RSpec::XSD
end
