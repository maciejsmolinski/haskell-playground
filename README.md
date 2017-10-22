# memcache-app

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