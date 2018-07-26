# kata-mars-rover
I choose this one to learn and play a bit with Crystal language.

Since it is done in an earlier version of Crystal (0.25.1), language features could change.

## Kata
Develop an api that moves a rover around on a grid.

### Rules:

- You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
- The *rover receives* a character array of commands.
- Implement commands that move the rover forward/backward (f,b).
- Implement commands that turn the rover left/right (l,r).
- Implement wrapping from one edge of the grid to another. (planets are spheres after all)
- Implement obstacle detection before each move to a new square. If a given sequence of commands encounters an obstacle,
  the rover moves up to the last possible point and reports the obstacle.

## Approach

There is a more nuanced point made by Uncle Bob regarding the above, that the Law of Demeter should not apply to pure data structures anyway.

Pure data structures (“objects” that have no behavior just data) are integral building blocks of a procedural, functional or a mixed paradigm approach. As such, they are of course exempt from having to comply with the Law of Demeter, which is a Law for Object-Oriented development.

## Installation

TODO: Write installation instructions here

## Usage

TODO: Write usage instructions here

format code
```crystal
crystal tool format src/
```

run tests
```crystal
crystal spec
```

## To improve

Error handling

## Contributing

1. Fork it (<https://github.com/your-github-user/kata-mars-rover/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Troubleshooting

https://crystal-lang.org/docs/installation/on_mac_osx_using_homebrew.html

## Contributors

- [albertllousas](https://github.com/albertllousas) Albert Llousas - creator, maintainer
