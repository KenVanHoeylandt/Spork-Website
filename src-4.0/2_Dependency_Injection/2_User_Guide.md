# User Guide

## Using Spork Inject

Spork creates instances of your classes and satisfies their dependencies. It uses the `javax.inject.Inject` annotation to identify which constructors and fields it is interested in.

Use the `ObjectGraph.bind()` method in a constructor or initialization method to wire up all dependencies. When a new instance is requested, Spork will obtain the required parameters values and invoke its constructor.
When `bind()` is called on an `ObjectGraph`, any other registered Spork binding (e.g. @BindView) is also resolved.

```java
class CoffeeMug {
    private Coffee coffee;
    private Mug mug;

    CoffeeMug(Coffee coffee, Mug mug) {
        this.coffee = coffee;
        this.mug = mug;
    }
}
```

Spork can inject fields directly. In this example it obtains an `Coffee` and a `Mug` instance for the respective fields:

```java
class CoffeeMug {
    @Inject private Coffee coffee;
    @Inject private Mug mug;

    ...
}
```

Spork also supports method injection, but Field injection is generally preferred.

## Declaring Dependencies

In the above sample, an `Coffee` and `Mug` are injected. Of course these dependencies must come from somewhere.

Dependencies should be defined in a `Module` as follows:

```java
@Provides Coffee provideCoffee() {
    return new BlackCoffee();
}
```

It's possible for a `@Provides` method to require dependencies on its own:

```java
@Provides Coffee provideCoffee(Water water, CoffeeBeans beans) {
    return new BlackCoffee(water, beans);
}

@Provides Mug provideMug() {
    return new MugWithPrint("Input Java, output Java.");
}
```

## Modules

The `@Provides`-annotated methods above are placed in a `Module`. Modules are POJO objects that define a set of dependencies:

```java
class BrewModule {
    @Provides Coffee provideCoffee(Water water, CoffeeBeans beans) {
        return new BlackCoffee(water, beans);
    }

    @Provides Mug provideMug() {
        return new MugWithPrint("Input Java, output Java.");
    }

    @Provides Water provideWater() {
        return new BoilingWater();
    }

    @Provides Beans provideBeans() {
        return new ArabicaBeans();
    }
}
```

### Building an ObjectGraph

A module is used to build an object graph. Object graphs hold state such as your singletons and named instances.

Creating an `ObjectGraph` is easy:

```java
ObjectGraph objectGraph = ObjectGraphs.builder()
    .module(new CoffeeMugModule())
    .build();
```

When putting it all together, the `CoffeeMug` from the sample above could be injected as follows:

```java
class CoffeeMug {
    @Inject private Coffee coffee;
    @Inject private Mug mug;

    public CoffeeMug() {
        ObjectGraphs.builder()
            .module(new BrewModule())
            .build()
            .inject(this);
    }
}
```

### ObjectGraph with parent

An object graph can have a parent object graph:

```java
ObjectGraph objectGraph = ObjectGraphs.builder(applicationObjectGraph)
    .module(new BrewModule())
    .build();
```

This way, it can resolve dependencies from its parent *and* from the `BrewModule`.

An ObjectGraph's modules can override the dependencies of the parent as long as the injection signature is an exact match: its type, qualifier and nullability must match.

## Scoped injection

A scoped instance is an instance that belongs to an `ObjectGraph` created at a specific level of the application. It is tied to the lifecycle of that `ObjectGraph`.

`Singleton` is a predefined scope that is always available at the root `ObjectGraph` in your application. It is tied to the lifecycle of that `ObjectGraph`.

`@Provides` methods in a module can specify a scope. It can be used like this:

```java
@Provides
@Singleton
CoffeeService provideCoffeeService() {
    return new CoffeeServiceImpl();
}
```

You can also create [custom scopes](3_Custom_Scopes), which can look like this:

```java
@Provides
@LocationScope(AMSTERDAM)
CoffeeService provideCoffeeService() {
    return new CoffeeServiceImpl();
}
```

In this case, the `Service` is bound to the lifecycle of the `ObjectGraph` that defines the `LocationScope`.

## Lazy injection

Instead of injecting an instance directly, they can also injected on a `Lazy<T>` field. When `get()` is called on the `Lazy` field, it will retrieve the injected instance from the module. Calling `get()` multiple times will return the same instances every time.

```java
class Programmer {
    @Inject private Lazy<CoffeeMug> coffeeMug;

    public Programmer() {
        ...

        drink(coffeeMug.get());
    }
}
```

## Provider injection

A `Provider<T>` is similar to a `Lazy<T>` field, but injects a new instance every time it is called.

Injecting `Provider<T>` is generally not advised. You might want to use the factory pattern instead or re-organize your logic and use a `Lazy<T>` field instead.

```java
class Programmer {
    @Inject private Provider<CoffeeMug> coffeeMug;

    public Programmer() {
        ...

        drink(coffeeMug.get());
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
class WaterModule {
    @Provides
    @Named("cold")
    public Water provideColdWater() {
        ...
    }

    @Provides
    @Named("hot")
    public Water provideHotWater() {
        ...
    }
}
```

This module can then be used to inject a `Faucet` class:

```java
class Faucet {
    @Inject
    @Named("cold")
    Water coldWater;

    @Inject
    @Named("hot")
    Water hotWater;

    ...
}
```

### Custom qualifiers

You can also define your own qualifiers. For example:

```java
@Qualifier
@Retention(RUNTIME)
public @interface Colored {
}
```

Using a `value()` method is also supported:

```java
@Qualifier
@Retention(RUNTIME)
public @interface Colored {
    Color value() default Color.WHITE;
}
```

The output of `value()` is used to create a unique identifier. This is done internally by calling `toString()` on `Color`.

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