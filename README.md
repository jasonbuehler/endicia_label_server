[![Gem Version](https://img.shields.io/gem/v/endicia_label_server.svg?style=flat-square)](http://badge.fury.io/rb/endicia_label_server)
[![Dependency Status](https://img.shields.io/gemnasium/ptrippett/endicia_label_server.svg?style=flat-square)](https://gemnasium.com/ptrippett/endicia_label_server)
[![Build Status](https://img.shields.io/travis/ptrippett/endicia_label_server.svg?style=flat-square)](https://travis-ci.org/ptrippett/endicia_label_server)
[![Coverage Status](https://img.shields.io/codeclimate/coverage/github/ptrippett/endicia_label_server.svg?style=flat-square)](https://codeclimate.com/github/ptrippett/endicia_label_server/coverage)
[![Code Climate](https://img.shields.io/codeclimate/github/ptrippett/endicia_label_server.svg?style=flat-square)](https://codeclimate.com/github/ptrippett/endicia_label_server)

# Endicia Label Server

Endicia Label Server Gem for accessing the Endicia Label Server API from Ruby. Using the gem you can:
  - Return quotes from the Endicia Label Server API
  - Book shipments
  - Return labels and tracking numbers for a shipment

## Installation

    gem install endicia_label_server

...or add it to your project's [Gemfile](http://bundler.io/).

## Documentation

Yard documentation can be found at [RubyDoc](http://www.rubydoc.info/github/ptrippett/endicia_label_server).

## Sample Usage

### Return rates

    require 'endicia_label_server'
    server = EndiciaLabelServer::Connection.new(test_mode: true)
    server.rate do |rate_builder|
      rate_builder.add :certified_intermediary, {
        account_id: ENV['ENDICIA_ACCOUNT_ID'],
        pass_phrase: ENV['ENDICIA_PASS_PHRASE'],
        token: ENV['ENDICIA_TOKEN']
      }
      rate_builder.add :requester_id, ENV['ENDICIA_REQUESTER_ID']
      rate_builder.add :mail_class, EndiciaLabelServer::SERVICES.keys.first
      rate_builder.add :mailpiece_dimensions, {
        length: '10',
        width: '10',
        height: '10'
      }
      rate_builder.add :weight_oz, "2"
      rate_builder.add :from_postal_code, '90210'
      rate_builder.add :to_postal_code, '02215'
      rate_builder.add :to_country_code, 'US'
    end


    # Then use...
    response.success?

## Running the tests

After installing dependencies with `bundle install`, you can run the unit tests using `rspec`.
