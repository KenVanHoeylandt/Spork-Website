# User Guide

## Using Spork Inject

Spork creates instances of your classes and satisfies their dependencies. It uses the `javax.inject.Inject` annotation to identify which constructors and fields it is interested in.

Use `Spork.bind()` in constructor or initialization methods so Spork can create instances of the dependencies. When a new instance is requested, Spork will obtain the required parameters values and invoke its constructor.

```java
class Car implements Vehicle {
	private final Engine engine;
	private final Driver driver;

	@Inject
	Car(Engine engine, Driver driver) {
		this.engine = engine;
		this.driver = driver;
	}
}
```

Spork can inject fields directly. In this example it obtains an `Engine` instance for the `engine` field and a `Driver` instance for the `driver` field.

```java
class Car {
	@Inject Engine engine;
	@Inject Driver driver;

	public Car() {
		Spork.bind(...);
	}
}
```

Spork also supports method injection, but Field injection is generally preferred.

Classes that lack `@Inject` annotations cannot be constructed by Spork.

## Declaring Dependencies

In the above sample, an `Engine` and `Driver` are injected. Of course these dependencies must come from somewhere.

Dependencies should be defined in a Module like this:

```java
@Provides Engine provideEngine() {
  return new DieselEngine();
}
```

It's possible for a `@Provides` method to require dependencies on its own:

```java
@Provides Engine provideEngine(Piston piston) {
  return new DieselEngine(piston);
}

@Provides Piston providePiston() {
  return new StrongPiston();
}
```

## Modules

The `@Provides`-annotated methods above are placed in a `Module`. Modules are POJO objects that define a set of dependencies:

```java
class CarModule {
	@Provides Engine provideEngine(Piston piston) {
	  return new DieselEngine(piston);
	}

	@Provides Piston providePiston() {
	  return new StrongPiston();
	}
}
```

### Building an ObjectGraph

A module is used to build an object graph. Object graphs hold state such as your singletons and named instances.

Creating an `ObjectGraph` is easy:

```java
ObjectGraph objectGraph = new ObjectGraph.Builder()
	.module(new CarModule())
	.build();
```

An `ObjectGraph` is then used to inject an instance:

```java
class Car {
	@Inject Engine engine;
	@Inject Driver driver;

	public Car() {
		Spork.bind(this, objectGraph);
	}
}
```

Object graphs can be nested. An object graph can have a parent object graph:

```java
ObjectGraph objectGraph = new ObjectGraph.Builder(applicationObjectGraph)
	.module(new CarModule())
	.build();
```

This way, it can resolve dependencies from its parent *and* from the `CarModule`.

## Singletons and Scoped bindings

(docs coming soon)

## Provider injection

(docs coming soon)

## Named and Qualifiers

(docs coming soon)

## Adding spork to your project

```groovy
dependencies {
    compile 'com.bytewelder.spork:spork-inject:4.0.0'
}
```

**Note**: Before release, `spork-inject` is available at maven repository `http://dl.bintray.com/bytewelder/maven-snapshot`

## License

```text
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```