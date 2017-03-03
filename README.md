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

## Building

Development:

```bash
daux serve --source=docs-main
daux serve --source=docs-3.0
daux serve --source=docs-4.0
```

Generation:

```bash
daux
```