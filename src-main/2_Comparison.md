|   | Spork | Android Annotations | Butter Knife | Dagger | RoboGuice |
|---|---|---|---|---|---|
| **No code generation** (1) | v | x | x | x | x |
| **Advanced Android support** (2) | v | v | v | x | v |
| **Inheritance-safe** (3) | v | x | v | v | x |
| **POJO injection** | v | v | x | v | v |
| **POJO stubbing** (4) | v | x | x | v | x |
| **Easily extensible** (5) | v | x | x | x | x |
| **Small library** (6) | v | x | v | v | x |


(1) No code generation

Libraries that generate code are less predictable at runtime, increase build times and in some cases are more difficult to debug (because you might need to debug the generated code).

(2) Advanced Android support

Has advanced support for Android for binding Views, Fragments, Clicks and more.

(3) Inheritance-safe:

Some libraries require you to inherit special classes before its functionality can work. For example `RoboActivity` with RoboGuice. Forcing to use a custom base class is considered bad practice.

(4) Mocking/stubbing support:

Integrated features for stubbing POJO injections.

(5) Easily extensible:

Create new functionality without having to re-build the library.

(6) Based on method count and dex:

- Spork: 262 methods, 45kB dex (verify [here](http://www.methodscount.com/?lib=io.github.sporklibrary%3Aspork-android%3A3.0.0))
- Android Annotations: (excluding generated code!) 6029 methods, 741kB dex (verify [here](http://www.methodscount.com/?lib=org.androidannotations%3Aandroidannotations%3A4.1.0))
- Butter Knife: (excluding generated code!) 196 methods, 37kB dex (verify [here](http://www.methodscount.com/?lib=com.jakewharton%3Abutterknife%3A8.3.0))
- Dagger: (excluding generated code!) 117 methods, 20kB dex (verify [here](http://www.methodscount.com/?lib=com.google.dagger%3Adagger%3A2.1))
- RoboGuice: 10280 methods, 1344kB dex (verify [here](http://www.methodscount.com/?lib=org.roboguice%3Aroboguice%3A4.0.0))

In reality, Spork will very likely be the smallest one, because no code is generated.