## Introduction

Spork Inject is a [fast][spork_performance] runtime [dependency injection][dependency_injection] framework for Java and Android. It is almost fully compatible with [Dagger][dagger] and is modeled on the [JSR-330][jsr-330] specification.

Some advantages of Spork Inject:
- Write less boilerplate code
- Manage your dependencies more easily
- Improve testability: swap or override dependencies for tests
- No code generation, which makes the code easier to review
- Decrease coupling between a class and its dependencies
- Forces you to think about your class dependencies, which can lead to better application design

## Dependencies

Add the following dependencies in `build.gradle`:

```groovy
repositories {
    jcenter()
}

dependencies {
    compile 'com.bytewelder.spork:spork-inject:4.0.0'
}
```

## Example

```java
public class BrewModule {
    @Provides
    public Mug provideMug() {
        return new MugWithPrint("Input Java, output Java.");
    }

    @Provides
    public Water provideWater() {
        return new BoilingWater();
    }

    @Provides
    public Beans provideBeans() {
        return new ArabicaBeans();
    }

    @Provides
    public Coffee provideCoffee(Water water, CoffeeBeans beans) {
        return new BlackCoffee(water, beans);
    }
}

class CoffeeMug {
    @Inject private Coffee coffee;
    @Inject private Mug mug;

    public CoffeeMug() {
        ObjectGraphs.builder()
            .module(new BrewModule())
            .build()
            .inject(this); // same as Spork.inject(this, objectGraph)
    }
}
```

[spork_performance]: ../4_About/1_Performance/index
[dependency_injection]: https://en.wikipedia.org/wiki/Dependency_injection
[dagger]: https://google.github.io/dagger/
[benchmarks]: http://spork.bytewelder.com/about/benchmarks/
[jsr-330]: https://jcp.org/en/jsr/detail?id=330