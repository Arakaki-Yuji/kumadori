# Kumadori

This is simple decorator for Ruby.

Kumadori mean make-up for Japanese Kabuki.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kumadori'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kumadori

## Usage

Kumadori decorate your instance by #{instance.class}Decorator class.

````ruby
#
# Basic ruby class.
#
class User
  attr_accesstor :first_name, :last_name

  def initialize(first_name, last_name)
    self.first_name = first_name
    self.last_name  = last_name
  end
end

#
# Decorator class for User instance.
#
class UserDecorator < Kumadori::BaseDecorator
  def full_name
    "#{self.last_name} #{self.first_name}"
  end
end

user = User.new('Yuji', 'Arakaki')

# user instance decorated by UserDecorator
decorated_user = Kumadori.decorate(user)

decorated_user.full_name # => "Arakaki Yuji"

````

if you not defined #{instance.class}Decorator class, it's instance decorated by Kumadori::BaseDecorator.
So, if you want defined method for every instance,
you just override Kumadori::BaseDecorator, and defined method.

````ruby

class Animal
end

module Kumadori
  class BaseDecorator < ::SimpleDelegator
    def live?
      true
    end
  end
end

animal = Animal.new


# Because of AnimalDecorator class is not defiend,
# it is decorated by Kumadori::BaseDecorator
decorated_animal = Kumadori.decorate(animal)

decorated_animal.live? # => true

````

if you want to decorate all items in collection,
use Kumadori.collection_decorate method.

````ruby

members = []
members << User.new('Kanoko', 'Higa')
members << User.new('Ai', 'Kawasaki')
members << User.new('Takeo', 'Kikuchi')

decorated_members = Kumadori.collection_decorate(members)

decorated_members.map{ |user| user.full_name} # => ["Higa Kanoko", "Kawasaki Ai", "Kikuchi Takeo"]

````

## Contributing

1. Fork it ( https://github.com/Arakaki-Yuji/kumadori/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
