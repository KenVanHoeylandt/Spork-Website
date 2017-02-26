# Spork Inject

This library provides POJO dependency injection through annotations provided by the `javax.inject` package.

Supported javax annotations:

- `javax.inject.Inject`
- `javax.inject.Singleton`
- `javax.inject.Named`
- `javax.inject.Provider`
- `javax.inject.Scope`
- `javax.inject.Qualifier`

Spork annotations included are:

- `spork.inject.Provides` for factory methods in a module that provide injectable instances

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