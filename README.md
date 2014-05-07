Xtop
=========
[![Code Climate](https://codeclimate.com/github/primedia/xtop.png)](https://codeclimate.com/github/primedia/xtop)
[![Build Status](https://travis-ci.org/primedia/xtop.png)](https://travis-ci.org/primedia/xtop)
[![Coverage Status](https://coveralls.io/repos/primedia/xtop/badge.png?branch=dev)](https://coveralls.io/r/primedia/xtop?branch=dev)
[![Dependency Status](https://gemnasium.com/primedia/xtop.png)](https://gemnasium.com/primedia/xtop)
[![Gem Version](https://badge.fury.io/rb/xtop.png)](http://badge.fury.io/rb/xtop)

## Requirements

Ruby 1.9.3 or greater. Ruby 2.0 support is untested right now, so please file an issue if you
experience a problem.

## Installation (Gemfile)

Add the Primedia gem source to your Gemfile:

    source 'http://gems.idg.primedia.com'
    
Add this line to your application's Gemfile:

    gem 'xtop'

And then execute:

    $ bundle install

## Installation (Shell)

Add the Primedia gem source:

    gem sources -a http://gems01.lab.primedia.com/

Install it via the gem command:

    $ gem install xtop

## Usage

To use Xtop, run the command:

    xtop

You should have a .xtop.rb file either:

1) In the directory you are calling it from
2) In your $HOME directory

If you don't have either one, it will exit immediately with no output.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Running the Tests

There are currently no tests.

## Credits

Jack Morrill
Edward Leung
Eric Toulson
Colin Rymer
Tyler Long
Tyler Boyd

## License

Xtop is released under the MIT License. See the bundled LICENSE file for details.
