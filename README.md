# Haskell Playground

[Haskell Language](https://www.haskell.org/) playground repository is supposed to consist of tiny projects that are easy to scan and reason about so that everybody can learn the language quickly by example.

# Requirements

* [Haskell Stack](https://docs.haskellstack.org/en/stable/README/)
* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Nodemon](https://github.com/remy/nodemon)

# Installation

* Run memcache server with `make up`
* Build and execute haskell code with `make run`
  - In order to watch for file changes and recompile please run `make watch` instead

# Interactive Debugging

```bash
$ stack ghci
*Main> :set -XOverloadedStrings
```

## Purpose of the repository

This repository is meant to be a playground so that everybody can learn the language, break things, change things or even improve them.

Feel free to create pull requests if you find these examples useful. Also, please let me know if you find them too easy or too complex or not interesting at all.

Thanks for the interest and taking your time to visit the repository!

## Stay in touch

Have questions? Raise an [issue](https://github.com/maciejsmolinski/elm-playground/issues) or contact me on twitter: [@maciejsmolinski](https://twitter.com/maciejsmolinski)