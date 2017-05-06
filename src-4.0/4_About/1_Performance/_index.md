# Performance

## Setup

Several benchmarks were carefully crafted to test performance. You can find them on [GitHub][github] in the support directory.

There are generally two kinds of benchmarks involved:
- cold cache benchmarks (contains `100` repetitions of cold cache scenario)
- warm cache benchmarks (contains `1000` repetitions of warm cache scenario, but starts off with cold cache)

Each benchmark is then repeated `10` times and outputs are averages over those repetitions.

Benchmarks are run on the following devices:
- `Nexus 5X`: Nexus 5X with Android 7.1.1
- `Nexus 4`: Nexus 4 with Android 5.1.1
- `Sunset 2`: Wiko Sunset 2 with Android 4.4.2

## Core annotation processing speed

This part describes Spork core performance: the ability to do runtime anotation processing.
Measurements exclude the actual binding implementation like resolving a View from an Object,
as the performance of such operations are not determined by Spork itself.

Binding `1` field with `cold` cache:
- `Nexus 5X`: `0.069 ms` to `0.072 ms`
- `Nexus 4`: `0.218 ms` to `0.236 ms`
- `Sunset 2`: `0.099` to `0.160 ms`

Binding `1` field with `warm` cache:
- `Nexus 5X`: `0.002 ms`
- `Nexus 4`: `0.005 ms`
- `Sunset 2`: `0.007 ms` to `0.023 ms`

Binding `5` fields with warm cache:
- `Nexus 5X`: `0.002 ms`
- `Nexus 4`: `0.004 ms` to `0.005 ms`
- `Sunset 2`: `0.013 ms` to `0.017 ms`

In conclusion, Spork's annotation processing core is extremely fast. The very first (cold cache) bind was done
in `0.069 ms` to `0.236 ms` and a warm cache bind on a single field was done in `0.002 ms` to `0.017 ms`.
Binding 5 fields with a warm cache increases binding time only with a few microseconds.

## Android annotation processing speed

A benchmark with Android bindings wouldn't be of much use, as we would mostly be measuring the performance of methods such
as `findViewById()` and `setContentView()`. The numbers for the core annotation processing give a decent impression of how fast
injection could be with `spork-android` and `spork-android-support`. There is definitely a little bit of overhead when,
injecting Spork Views/Fragments/etc. but this is negligable.

## Dependency injection speed

This part describes the performance of the `spork-inject` library.
Every measurement here includes Spork's core Annotation processing time including the dependency injection implementation's time.

Injecting `1` field with `cold` cache:
- `Nexus 5X`: `0.087 ms` to `0.105 ms`
- `Nexus 4`: `0.508 ms` to `0.562 ms`
- `Sunset 2`:  `0.258 ms` to `0.641 ms`

Injecting `1` field with `warm` cache:
- `Nexus 5X`: `0.008 ms`
- `Nexus 4`: `0.037 ms`
- `Sunset 2`: `0.021 ms` to `0.024 ms`

Injecting `5` fields with warm cache:
- `Nexus 5X`: `0.037 ms` to `0.038 ms`
- `Nexus 4`: `0.158 ms` to `0.161 ms`
- `Sunset 2`: `0.071 ms` to `0.079 ms`

Injecting `1` method with `cold` cache:
- `Nexus 5X`: `0.062 ms` to `0.071 ms`
- `Nexus 4`: `0.221 ms` to `0.236 ms`
- `Sunset 2`: `0.187 ms` to `0.261 ms`

Injecting `1` method with `warm` cache:
- `Nexus 5X`: `0.011 ms`
- `Nexus 4`: `0.041 ms` to `0.042 ms`
- `Sunset 2`: `0.024 ms` to `0.027 ms`

Injecting `5` method with warm cache:
- `Nexus 5X`: `0.051 ms` to `0.053 ms`
- `Nexus 4`: `0.200 ms` to `0.204 ms`
- `Sunset 2`: `0.105 ms` to `0.109 ms`

Injecting a mixed object with warm cache:
- `Nexus 5X`: `0.039 ms`
- `Nexus 4`: `0.155 ms` to `0.160 ms`
- `Sunset 2`: `0.101 ms` to `0.106 ms`

In conclusion, injection is pretty fast: they generally take somewhere between `0.007 ms` and `0.033 ms` per field depending on the device.
Method injection is slightly slower at `0.010 ms` to '0.041 ms`.

The very first bind on the first class might take a bit longer, but it will generally stay below `0.5 ms`. On newer hardware, it will `0.1 ms` or less

Field injection seems to be noticably faster than method injection with speed improvements at around 30%.
This is great, considering that field injection is generally the preferred way of injecting anyway.

[github]: https://github.com/ByteWelder/Spork
