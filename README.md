# Tic-Tac-Toe
Ruby Tic Tac Toe Console Game

## Dependencies

Ruby 2.7.2

## Set up

    $ git clone https://github.com/kzkaed/tic-tac-toe.git

    $ cd tic-tac-toe
    
    $ gem install bundler
    
    $ bundle install


Play Tic-Tac-Toe as Human to Human, Computer to Human, Human to Computer, or Computer to Computer.

## To play the game:

To run Human to Human game:

    $ ruby bin/run.rb

To run Human to Computer game with smart ai:

    $ ruby bin/run.rb HC

To run Computer to Human gme with smart ai:

    $ ruby bin/run.rb CH

To run Computer to Computer game with smart ai:

    $ ruby bin/run.rb CC

To run Human to Dumb Computer game:

    $ ruby bin/run.rb D

##To test:

To test unit

    $ rake spec

To test unit and integration

    $ rake all

## Contributing

1. Fork it ( https://github.com/kzkaed/tic-tac-toe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
