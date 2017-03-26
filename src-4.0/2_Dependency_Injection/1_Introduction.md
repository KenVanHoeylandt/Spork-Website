# Spork Inject

Spork Inject is a runtime [dependency injection][dependency_injection] framework for Java and Android. It is almost fully compatible with [Dagger][dagger] and is modeled on the [JSR-330][jsr-330] specification.

## Dependencies

Add the following dependencies in `build.gradle`:

```groovy
repositories {
    jcenter()
}

dependencies {
    compile 'com.bytewelder.spork:spork:4.0.0'
    compile 'com.bytewelder.spork:spork-inject:4.0.0'
}
```

## Example

```java
public static class Module {
    @Provides
    public Integer provideNumber() {
        return 1;
    }

    @Provides
    @Named("color")
    public String provideColor() {
        return "red";
    }

    @Provides
    @Named("label")
    public String provideLabel() {
        return "Hi!";
    }

    @Provides
    @Singleton
    public RestService provideRestService(HttpService service) {
        return new RestServiceImpl(service);
    }

    @Provides
    @Singleton
    public HttpService provideHttpService() {
        return new HttpServiceImpl(service);
    }
}

private static class Parent {
    @Inject
    private Integer number;

    @Inject
    @Named("color")
    private String color;

    @Inject
    @Named("label")
    private String label;

    @Inject
    private RestService restService;

    public Parent() {
        new ObjectGraph.Builder()
                .module(new Module())
                .build()
                .inject(this);
    }
}
```

[dependency_injection]: https://en.wikipedia.org/wiki/Dependency_injection
[dagger]: https://google.github.io/dagger/
[benchmarks]: http://spork.bytewelder.com/about/benchmarks/
[jsr-330]: https://jcp.org/en/jsr/detail?id=330