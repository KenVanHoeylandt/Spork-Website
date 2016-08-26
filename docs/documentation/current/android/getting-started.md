# Getting Started on Android

## Download

Edit `build.gradle` and add the following dependency:

```groovy
dependencies {
    compile 'io.github.sporklibrary:spork-android:3.0.0'
	compile 'io.github.sporklibrary:spork-android-support:3.0.0@aar'
}
```

You may also download the libraries manually through [maven.org](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22io.github.sporklibrary%22).

That's it! Check out the menu to see some examples or the list of annotations.

## Upgrading from 2.x to 3.x

- Spork Android has changed its files from `io.github.sporklibrary` to `io.github.sporklibrary.android`
- There are separate dependencies for the Android support/compat libraries:
 - 'io.github.sporklibrary:spork-android:3.0.0'
 - 'io.github.sporklibrary:spork-android-support:3.0.0@aar'