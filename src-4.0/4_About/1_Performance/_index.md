# Performance

## Setup

For this setup, a set of benchmarks are created. You can find them on [GitHub][github] in the support directory of the project.
The benchmarks are created carefully to measure the right things.

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
- `Nexus 5X`: 0.053 to 0.085 ms
- `Nexus 4`: 0.146 to 0.191 ms
- `Sunset 2`: 0.327 to 0.408 ms

Binding `1` field with `warm` cache:
- `Nexus 5X`: < 0.001 to 0.002ms
- `Nexus 4`: 0.003 to 0.004 ms
- `Sunset 2`: 0.007 to 0.011 ms

Binding `5` fields with warm cache:
- `Nexus 5X`: < 0.001 to 0.002 ms
- `Nexus 4`: 0.005 ms
- `Sunset 2`: 0.010 to 0.013 ms

In conclusion, Spork's annotation processing core is extremely fast. The very first (cold cache) bind was done
in 0.053 to 0.408 ms and a warm cache bind on a single field was done in 0.001 ms to 0.011 ms.
Binding 5 fields with a warm cache increases binding time only with a few microseconds.

## Dependency injection speed

This part describes the performance of the `spork-inject` library.
Every measurement here includes Spork's core Annotation processing time including the dependency injection implementation's time.

Injecting `1` field with `cold` cache:
- `Nexus 5X`: 0.086 to 0.108 ms
- `Nexus 4`: 0.577 to 0.608 ms
- `Sunset 2`: 0.335 to 0.558 ms

Injecting `1` field with `warm` cache:
- `Nexus 5X`: 0.008 to 0.010 ms
- `Nexus 4`: 0.047 to 0.057 ms
- `Sunset 2`: 0.023 ms

Injecting `5` fields with warm cache:
- `Nexus 5X`: 0.038 ms
- `Nexus 4`: 0.206 to 0.234 ms
- `Sunset 2`: 0.078 to 0.079 ms

Injecting `1` method with `cold` cache:
- `Nexus 5X`: 0.069 to 0.088 ms
- `Nexus 4`: 0.240 to 0.259 ms
- `Sunset 2`: 0.195 to 0.197 ms

Injecting `1` method with `warm` cache:
- `Nexus 5X`: 0.012 ms
- `Nexus 4`: 0.059 to 0.065 ms
- `Sunset 2`: 0.029 to 0.031 ms

Injecting `5` method with warm cache:
- `Nexus 5X`: 0.063 to 0.065 ms
- `Nexus 4`: 0.262 to 0.288 ms
- `Sunset 2`: 0.119 to 0.126 ms

Injecting a mixed object with warm cache:
- `Nexus 5X`: 0.046 ms
- `Nexus 4`: 0.176 to 0.196 ms
- `Sunset 2`: 0.115 to 0.123 ms

In conclusion, injection is pretty fast: they take somewhere between 8 and 60 microseconds per field or method depending on the device.
Injecting 5 fields on a single object will generally be done in less than 0.1 millisecond - and on slow devices in about 0.2 milliseconds.

[github]: https://github.com/ByteWelder/Spork
