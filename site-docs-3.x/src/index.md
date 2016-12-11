# Spork 3.x

### Getting started

Add the following dependencies in `build.gradle`:

```groovy
dependencies {
	// Spork core, including component injection
    compile 'io.github.sporklibrary:spork:3.2.0'
    // Spork for Android
    compile 'io.github.sporklibrary:spork-android:3.0.0@aar'
    // Optional: Spork Android support/compat library bindings (e.g. support Fragment injection)
    // It requires you to also add: appcompat-v7, support-v4, recyclerview-v7
	compile 'io.github.sporklibrary:spork-android-support:3.0.0@aar' 
}
```

All dependencies are available at [Maven Central Repository](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22io.github.sporklibrary%22).

### Upgrading from 2.x to 3.x:

- Spork Android has changed its files from `io.github.sporklibrary` to `io.github.sporklibrary.android`
- There are separate dependencies for the Android support/compat libraries as defined above.