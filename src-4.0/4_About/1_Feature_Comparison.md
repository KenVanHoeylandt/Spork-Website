# Android Annotations

Comparison of libraries that provide bindings for Android.
(e.g. binding views to fields.)

|   | Spork | Android Annotations | Butter Knife |
|---|---|---|---|
| **Code generation** (1) |  | x | x |
| **Inheritance-safe** (3) | x |  | x |
| **Easily extensible** (5) | x |  |  |
| **Small library** (6) | x |  | x |
| **Performance** (7) | lower | higher | higher |


# Dependency Injection

|   | Spork | Android Annotations | Dagger |
|---|---|---|---|---|
| **Code generation** (1) |  | x | x |
| **Inheritance-safe** (3) | x |  | x |
| **DI overridible** (4) | x |  | x |
| **Easily extensible** (5) | x |  |  |
| **Small library** (6) | x |  | x |
| **Performance** (7) | lower | higher | higher |



(1) No code generation

Libraries that generate code are less predictable at runtime, increase build times and in some cases are more difficult to debug (because you might need to debug the generated code).

(2) Android injection

Has advanced support for Android for binding Views, Fragments, Clicks and more.

(3) Inheritance-safe:

Some libraries require you to inherit special classes before its functionality can work. For example `RoboActivity` with RoboGuice. Forcing to use a custom base class is considered bad practice.

(4) DI overridible:

Dependency injection can be overriden for testing purposes.

(5) Easily extensible:

Create new functionality without having to re-build the library.

(6) Based on method count and dex:

- `spork`: 111 methods, 15kB dex (verify [here](http://www.methodscount.com/?lib=com.bytewelder.spork%3Aspork%3A4.0.0))
- `spork-android`: TBD (includes `spork` dependency, verify [here](http://www.methodscount.com/?lib=com.bytewelder.spork%3Aspork-android%3A4.0.0))
- `spork-inject`: 332 methods, 52kB dex (includes `spork` dependency, verify [here](http://www.methodscount.com/?lib=com.bytewelder.spork%3Aspork-inject%3A4.0.0))
- Android Annotations: (excluding generated code!) 6068 methods, 746kB dex (verify [here](http://www.methodscount.com/?lib=org.androidannotations%3Aandroidannotations%3A4.3.0))
- Butter Knife: (excluding generated code!) 196 methods, 37kB dex (verify [here](http://www.methodscount.com/?lib=com.jakewharton%3Abutterknife%3A8.3.0))
- Dagger: (excluding generated code!) 117 methods, 20kB dex (verify [here](http://www.methodscount.com/?lib=com.google.dagger%3Adagger%3A2.1))
- RoboGuice: 10280 methods, 1344kB dex (verify [here](http://www.methodscount.com/?lib=org.roboguice%3Aroboguice%3A4.0.0))

In reality, Spork will very likely be the smallest one, because no code is generated.

(7) Performance:

Spork's performance might be lower than code generation solution, but it is still [very fast](Performance).