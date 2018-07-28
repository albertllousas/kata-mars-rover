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
The solution is a mixed paradigm approach of object oriented programming and functional programming with pure data structures.

## Installation & Troubleshooting

```shell
crystal -v
Crystal 0.25.1 (2018-06-30)
```
Install crystal lang following instructions here :

https://crystal-lang.org/docs/installation/on_mac_osx_using_homebrew.html

##Usage

It is an API of rover, take a look on the test to see how it looks.

### IDE
Given it is an earlier version of crystal, IDEs as idea are not supporting it well yet.
I would recommend using [atom.io](https://atom.io/) with crystal packages.

### run tests
```crystal
crystal spec
```
### format code
```crystal
crystal tool format src/
```

## To improve

- Error handling: Crystal's way to do error handling is by raising and rescuing exceptions without typing methods,
  could be improved with a using a simple wrapper or a monadic structure
- Mocking libraries: https://github.com/waterlink/mocks.cr is not working with crystal `0.25.1`, so it was not possible to mock  

## Contributing

1. Fork it (<https://github.com/your-github-user/kata-mars-rover/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Contributors

- [albertllousas](https://github.com/albertllousas) Albert Llousas - creator, maintainer
