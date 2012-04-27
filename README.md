# ActsAsPurchasable

Everything has it's price, and now your ActiveRecord models can too!

`acts_as_purchasable` extends ActiveRecord models with methods that
allow you to perform simple payment transactions on your models.

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_purchasable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_purchasable


## Usage

To use `acts_as_purchasable` simply add the following line to the model of anything you
want to sell:

    acts_as_purchasable

Example of the minimal setup needed to purchase a model:

    class FoobarWidget < ActiveRecord::Model
      acts_as_purchasable

      attr_accessor :price

      before_purchase :verify_credit_card
      after_purchase :email_recipt

      on_purchase do |purchase_data|
        Rails.logger.puts "Purchased FoobarWidget for #{purchase_data[:price]}!"
      end

      def verify_credit_card
        …
      end

      def email_recipt
        …
      end

    end

`FoobarWidget` can now be purchased using the `#purchase!` method:

    widget = FoobarWidget.first
    widget.price # => 5.00
    widget.purchase! # => true

The `purchase!` method will trigger the `before_purchase` callback and
record the transaction if said callback succeeds.

Upon a successful transaction, the `after_purchase` callback is
executed, allowing you to handle any other user interaction or business
logic that needs to be done.

## Contributing

0. Fork it
0. Create your feature branch (`git checkout -b my-new-feature`)
0. Commit your changes (`git commit -am 'Added some feature'`)
0. Ensure your commits are tested and that all tests are green
0. Push to the branch (`git push origin my-new-feature`)
0. Create new Pull Request
