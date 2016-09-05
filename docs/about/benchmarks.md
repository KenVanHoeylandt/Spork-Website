# Benchmarks

Last updated on September 5, 2016

## Setup

The test results below are output from the open source [Spork Benchmark](https://github.com/SporkLibrary/Spork-Benchmark) applications.

To test performance, I created 2 new annotations with their own annotation binder: `@BindTest1` and `@BindTest2`. Binding the annotation to an object increases a global static counter and does nothing else. This is to ensure that we are only measuring Spork performance and not any additional behaviors.

Both annotations and annotation binders are in effect the same. This is to see potential differences in caching levels (JVM cache versus different types of internal caching).

The type that we bind in the test has 5 fields that each have been marked with the annotation. It looks something like this:

```java
public class TestObject {
	@BindTest1 Object a;
	@BindTest1 Object b;
	@BindTest1 Object c;
	@BindTest1 Object d;
	@BindTest1 Object e;

	public void bind() {
		Spork.bind(this);
	}
}
```

There are several benchmarks and all benchmarks are ran `10` times:

 - Bind 1 object instance with `@BindTest1` fields
 - Bind 1 object instance with `@BindTest2` fields
 - Bind 1000 objects instances with `@BindTest1` fields
 - Bind 1000 objects instances with `@BindTest2` fields

## Raw results

 - [Nexus 5X with Android 7.0](benchmark/nexus-5x.txt)
 - [Nexus 4 with Android 5.1.1](benchmark/nexus-4.txt) (made in 2012)
 - [HTC One X with Android 4.2.2](benchmark/htc-one-x.txt) (made in 2012)
 - [Mac Mini Mid 2011 @ 2.3GHz i5](benchmark/mac-mini-2011.txt) (made in 2011)

## Conclusion

Reflection is really fast on Android.  It generally takes only several microseconds (not even milliseconds!) on `Nexus 4` to bind an object.

The very first binding (of any type on any instance) is a bit slower due to cache creation and/or cache warming. This will take on average less than `10 ms` on 4 year old hardware and I think this is very acceptable. The fastest cold cache binding time was `3 ms` on a `Nexus 4` and `1.354 ms` on a `Nexus 5X`.

### Averages

Binding on object took on average about:

 - `0.0003 ms` on the `Nexus 5X` with `Android 7.0`
 - `0.002 ms` on the `Nexus 4` with `Android 5.1.1`
 - `0.05 ms` on the `HTC One X` with `Android 4.2.2`

### First bind speed

The very first bind throughout a benchmarking session always takes a bit longer. This is due to cold cache in Spork.

The first instance bind took:

 - `1.3 ms` to `2.7 ms` on the `Nexus 5X` with `Android 7.0`
 - `3 ms` to `12 ms` on the `Nexus 4` with `Android 5.1.1`
 - `5 ms` to `12 ms` on the `HTC One X` with `Android 4.2.2`
