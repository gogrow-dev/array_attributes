# ArrayAttributes

A Rails plugin to encapsulate common array attributes methods.

This gem can be used to avoid repeating the same methods in models when working with arrays.

## Support

**This branch targets Ruby 2.4+ only**


## Usage

#### Install gem:

Add this line to your Gemfile:
```ruby
gem 'array_attributes'
```

then run:
```shell
bundle install
```

#### Enable ArrayAttributes

```ruby
class Book < ActiveRecord::Base
  string_array_attributes [:authors, :countries]
end
```

It assumes you are passing string attributes.

It also supports the following options:

  * `:reject_blank`: whether the attribute should skip blank values
  * `:reject_if`: condition to reject values

```ruby
class Device < ActiveRecord::Base
  string_array_attributes [:ips], reject_blank: true, reject_if: ->(value) { value == '127.0.0.1' }
end
```

### attribute_raw

You can invoke `attribute_raw` to get the array values joined by commas.

```ruby
book = Book.create(authors: ['John Doe', 'Jane Doe'])
book.authors_raw #=> "John Doe, Jane Doe"
```

### attribute_raw=

You can invoke `attribute_raw=` to set the array value by entering the values split by commas.

```ruby
book = Book.new
book.authors_raw="John Doe, Jane Doe"
book.save!
book.authors #=> ["John Doe", "Jane Doe"]
```

See `LICENSE`.