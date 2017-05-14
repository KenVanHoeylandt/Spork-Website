# Performance

## TL;DR

Spork's core binding speed is *really* fast. Depending on the hardware, binding a field with warm cache was measured at:
- about `1 μs` on a `Nexus 5X`
- about `3 μs` on a `Nexus 4` (a device from 2012!)
- about `6 μs` on a `Wiko Sunset 2` (bought new for 50 euro or less in 2016)

Spork Android bindings are expected to be in line with the above measurements.
The core binding speed implies that Android View injection can be done very quickly and for many Views that you create on the fly.

Spork Dependency Injection is slower, but still very fast. When injecting `5` fields, the duration `per field` was measured at:
- `10 μs` on a `Nexus 5X`
- `34 μs` on a `Nexus 4` (slower, but this is a > 4.5 year old device after all - and still fast enough for binding Activity/Fragment/etc.)
- `13 μs` on a `Wiko Sunset 2` (impressive for a such a cheap device from 2 years ago)

Spork Dependency Injection is slower, but it is still very fast in absolute terms: unless you're using an ancient device,
injecting `5` fields will generally stay well below `100 μs`. That means you could inject well over `50k fields/second` on a single core.

Using all your CPU power for injection is not a great idea though, so I advise using `spork-inject` on your main objects
including services, view controllers, main views, presenters, and other main objects.

## Setup

Several benchmarks were carefully crafted to test performance. You can find them on [GitHub][github] in the support directory.

Benchmarks are run on the following devices:
- LG `Nexus 5X` with `Android 7.1.1`
- LG `Nexus 4` with `Android 5.1.1`
- Wiko `Sunset 2` with `Android 4.4.2`

Duration can be influenced by factors such as garbage collection being triggered during the test.
That's why the benchmark was run 3 times on each device and the best measurements can be found below.

## Core annotation processing speed

This part describes Spork core performance: the ability to do runtime anotation processing.
Measurements exclude the actual binding implementation like resolving a View from an Object,
as the performance of such operations are not determined by Spork itself.

Binding `1` field with `cold` cache:
- `Nexus 5X`: `0.065 ms`
- `Nexus 4`: `0.209 ms`
- `Sunset 2`: `0.162 ms`

Binding `1` field with `warm` cache:
- `Nexus 5X`: `0.001 ms`
- `Nexus 4`: `0.003 ms`
- `Sunset 2`: `0.006 ms`

Binding `5` fields with warm cache:
- `Nexus 5X`: `0.002 ms`
- `Nexus 4`: `0.005 ms`
- `Sunset 2`: `0.008 ms`

In conclusion, Spork's annotation processing core is extremely fast. The very first (cold cache) bind was done
in `0.065 ms` to `0.216 ms` and a warm cache bind on a single field was done in `0.001 ms` to `0.008 ms`.
Binding 5 fields with a warm cache took between `0.002 ms` and `0.009 ms` which shows that the cost per extra field is very low.

## Android annotation processing speed

A benchmark with Android bindings wouldn't be of much use, as we would mostly be measuring the performance of methods such
as `findViewById()` and `setContentView()`. The numbers for the core annotation processing give a decent impression of how fast
injection could be with `spork-android` and `spork-android-support`. There is definitely a little bit of overhead when,
injecting Spork Views/Fragments/etc. but this is negligable.

## Dependency injection speed

This part describes the performance of the `spork-inject` library.
Every measurement here includes Spork's core Annotation processing time including the dependency injection implementation's time.

Injecting `1` field with `warm` cache:
- `Nexus 5X`: `0.013 ms`
- `Nexus 4`: `0.036 ms`
- `Sunset 2`: `0.017 ms`

Injecting `5` fields with warm cache:
- `Nexus 5X`: `0.052 ms`
- `Nexus 4`: `0.168 ms`
- `Sunset 2`: `0.064 ms`

Injecting `1` method with `warm` cache:
- `Nexus 5X`: `0.014 ms`
- `Nexus 4`: `0.041 ms`
- `Sunset 2`: `0.022 ms`

Injecting `5` method with `warm` cache:
- `Nexus 5X`: `0.059 ms`
- `Nexus 4`: `0.183 ms`
- `Sunset 2`: `0.092 ms`

Injecting a mixed object with `warm` cache:
- `Nexus 5X`: `0.038 ms`
- `Nexus 4`: `0.145 ms`
- `Sunset 2`: `0.091 ms`

Dependency injection is pretty fast. It generally took somewhere between `0.010 ms` and `0.034 ms` per field (when injecting 5) depending on the device.
Method injection was a little bit slower at `0.012 ms` to `0.036 ms` per method (when injecting 5).

Field injection seems to be noticably faster than method injection.
This is great, considering that field injection is generally the preferred way of injecting anyway.

[github]: https://github.com/ByteWelder/Spork
