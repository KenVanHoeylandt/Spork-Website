# Spork Website

The Spork website is made with [Daux.io](http://daux.io).

## Installation

Install Composer:

```bash
curl -sS https://getcomposer.org/installer | php
```

Add a `composer` alias to your bash profile:

```bash
alias composer="php /usr/local/bin/composer.phar"
```

Install Daux.io:

```bash
composer global require justinwalsh/daux.io
```

Make the `daux` command available in your bash profile:

```bash
export PATH="~/.composer/vendor/bin:$PATH"
```

## Development

```bash
daux serve --source=src-3.0
daux serve --source=src-4.0
```

## Releasing

```bash
./build.sh
```