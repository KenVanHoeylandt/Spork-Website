# Spork Inject

Spork Inject is a runtime [dependency injection] [dependency_injection] framework for Java and Android. It is almost fully compatible with [Dagger] [dagger] and is modeled on the [JSR-330] [jsr-330] specification.

Spork Injection aims to avoid code generation as modern platforms since Android 4.1 have grown [fast enough] [benchmarks] to apply injection at runtime.

## Dependencies

Add the following dependencies in `build.gradle`:

```groovy
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
	@Named("anything")
	public String provideColor() {
		return "123";
	}

	@Provides
	@Singleton
	public DownloadService provideDownloadService(HttpService service) {
		return new DownloadServiceImpl(service);
	}

	@Provides
	@Singleton
	public HttpService provideHttpService() {
		return new HttpServiceImpl(service);
	}
}

private static class Parent {
	@Inject
	private Integer integerValue;

	@Inject
	@Named("color")
	private String color;

	@Inject
	@Named("anything")
	private String anything;

	@Inject
	private DownloadService downloadService;

	public Parent() {
		ObjectGraph graph = new ObjectGraph.Builder()
				.module(new Module())
				.build();

		Spork.bind(this, graph);
	}
}
```

[dependency_injection]: https://en.wikipedia.org/wiki/Dependency_injection
[dagger]: https://google.github.io/dagger/
[benchmarks]: http://spork.bytewelder.com/about/benchmarks/
[jsr-330]: https://jcp.org/en/jsr/detail?id=330