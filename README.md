# ArrayAttributes

A Rails plugin to encapsulate common array attributes methods.

This gem can be used to avoid repeating the same methods in models when working with arrays.

## Support

**This branch targets Ruby 2.4+ only**


## Usage

#### Install gem:

```ruby
gem 'array_attributes'
```

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

### compact_attribute

You can invoke `compact_attribute` to remove blank items from the array attribute.

```ruby
book = Book.new(authors: ['John Doe', 'Jane Doe', ''])
book.compact_authors
book.save!
book.authors #=> ["John Doe", "Jane Doe"]
```

See `LICENSE`.