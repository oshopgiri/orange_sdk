[![Build Status](https://travis-ci.org/oshopgiri/orange_sdk.svg?branch=master)](https://travis-ci.org/oshopgiri/orange_sdk)
[![Maintainability](https://api.codeclimate.com/v1/badges/417182c1fbddf4a34452/maintainability)](https://codeclimate.com/github/oshopgiri/orange_sdk/maintainability)

# Orange SDK

Consume APIs for [Orange Products](https://developer.orange.com/products/) with ease.

Currently supports the following services:
* [SMS Mali - Business v1.1](https://developer.orange.com/apis/sms-ml)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'orange_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orange_sdk

## Usage

Gem requires the following configurations in ENV:
* **ORANGE_AUTHORIZATION_TOKEN**: Authorization token from Orange app's Details section

To request for an access token, use:
```ruby
Orange::Auth.token
```

To send an SMS, use:
```ruby
Orange::SMS.dispatch(sender_contact: '+22737373737', recipient_contact: '+22737373737', message: 'Test SMS') 
```
`Orange::SMS.dispatch` accepts the following parameters:
* `sender_name`: Name of the sender to be displayed. Defaults to `sender_contact`
* `sender_contact`: Contact number of the sender. Should include the country code
* `recipient_contact`: Contact number of the recipient. Should include the country code
* `message`: Message to be sent

## Test

Just run rspec in your terminal:

    $ bundle exec rspec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/oshopgiri/orange_sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

1. Fork the repo
2. Create a feature or bug fix branch (`git checkout -b my_awesome_branch`)
3. Commit your changes (`git commit -m "My Awesome Code"`)
4. Push to your branch (`git push remote my_awesome_branch`)
5. Create a pull request to [oshopgiri/orange_sdk](https://github.com/oshopgiri/orange_sdk)


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
