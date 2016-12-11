# Spork Inject

This library provides POJO dependency injection through annotations provided by the `javax.inject` package.

Supported javax annotations:

- `javax.inject.Inject`
- `javax.inject.Singleton`

Spork annotations included are:

- `spork.inject.Lazy` for lazy injection of variables
- `spork.inject.Provides` for factory methods in a module that provide injectable instances