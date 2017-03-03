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
	@Inject private Engine engine;
	@Inject private Driver driver;

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

Module methods annotated with `@Provides` can also have scope annotations. Scopes can be custom-made, but `@Singleton` is one that is available by default. It can be used like this:

```java
@Provides
@Singleton
UserService provideUserService() {
	return new UserServiceImpl();
}
```

Scoped instances such as the singleton instance above are associated with the `ObjectGraph` that the `Module` belons to. This means that their scope is only valid for objects injected with that `ObjectGraph`.

## Lazy injection

Instead of injecting an instance directly, they can also injected on a `Lazy<T>` field. When `get()` is called on the `Lazy` field, it will retrieve the injected instance from the module. Calling `get()` multiple times will return the same instances every time.

```java
class Car {
	@Inject private Lazy<Engine> engine;

	public Car() {
		Spork.bind(...);

		engine.get().start();
	}
}
```

## Provider injection

A `Provider<T>` is similar to a `Lazy<T>` field, but injects a new instance every time it is called.

Injecting `Provider<T>` is generally not advised. You might want to use the factory pattern instead or re-organize your logic and use a `Lazy<T>` field instead.

```java
class Car {
	@Inject private Provider<Engine> engine;

	public Car() {
		Spork.bind(...);

		engine.get().start();
	}
}
```

## Qualifiers

Sometimes it is not sufficient to bind by type alone. In such cases, you might want to identify an injection by some kind of identifier.

In such cases, you can define a new annotation and add to it a `@Qualifier` annotation.

### Named

The `@Named` annotation is one that is available by default:

```java
@Qualifier
@Documented
@Retention(RUNTIME)
public @interface Named {
	String value() default "";
}
```

A module is then available to provide named injections:

```java
class CarModule {
	@Provides
	@Named("driver")
	public Seat provideDriverSeat() {
		...
	}

	@Provides
	@Named("passenger")
	public Seat providePassengerSeat() {
		...
	}
}
```

This module can then be used to inject a Car:

```java
class Car {
	@Inject
	@Named("driver")
	Seat driverSeat;

	@Inject
	@Named("passenger")
	Seat passengerSeat;

	...
}
```

### Custom qualifiers

You can also define your own qualifiers. For example:

```java
@Qualifier
@Documented
@Retention(RUNTIME)
public @interface Colored {
	Color value() default Color.WHITE;
}
```

After defining the annotation, we have to define how it can serialize into a unique identifier:

```java
AnnotationSerializerRegistry.register(Colored.class, new ColoredSerializer());
```

## Adding spork to your project

```groovy
repositories {
	jcenter()
}

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