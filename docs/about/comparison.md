# Comparison

|   | Spork | Android Annotations | Butter Knife | Dagger | RoboGuice |
|---|---|---|---|---|---|
| **No code generation** (1) | v | x | x | x | x |
| **Advanced Android support** (2) | v | v | v | x | v |
| **Inheritance-safe** (3) | v | x | v | v | x |
| **POJO injection** | v | v | x | v | v |
| **POJO mocking/stubbing** (4) | v | x | x | x | x |
| **Easily extensible** (5) | v | x | x | x | x |
| **Supported features** | fewer | more | fewer | more | more |
| **Library size** (6) | small | large | small | small | very large |


(1) No code generation

Libraries that generate code are less predictable at runtime, increase build times and in some cases are more difficult to debug (because you might need to debug the generated code).

(2) Advanced Android support

Has advanced support for Android for binding Views, Fragments, Clicks and more.

(3) Inheritance-safe:

Some libraries require you to inherit special classes before its functionality can work. For example `RoboActivity` with RoboGuice. Forcing to use a custom base class is considered bad practice.

(4) Mocking/stubbing support:

Integrated features for mocking POJO injections: during injection/binding, mocked classes are bound directly.

(5) Easily extensible:

Create new functionality without having to re-build the library.

(6) Library size:

- Spork: +- 50kB (verify [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion) and [here](https://bintray.com/sporklibrary/spork/spork-android/_latestVersion) under "files")
- Android Annotations: [+- 500kB](http://search.maven.org/#artifactdetails%7Corg.androidannotations%7Candroidannotations%7C4.0.0%7Cjar) + generated code
- Butter Knife: [+- 50kB](http://search.maven.org/#artifactdetails%7Corg.androidannotations%7Candroidannotations%7C4.0.0%7Cjar) + generated code
- Dagger: [+- 20kB](http://search.maven.org/#artifactdetails%7Ccom.google.dagger%7Cdagger%7C2.1%7Cjar) + generated code
- RoboGuice [+- 1.6MB](http://search.maven.org/#artifactdetails%7Corg.roboguice%7Croboguice%7C4.0.0%7Cjar)

