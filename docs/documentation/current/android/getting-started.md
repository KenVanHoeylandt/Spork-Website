# Getting Started on Android

## Download

Edit your build.gradle file and add the repository:

```groovy
repositories {
    mavenCentral()
    maven {
        url "https://dl.bintray.com/sporklibrary/spork"
    }
}
```

The next step is to add dependencies:

```groovy
dependencies {
    compile 'io.github.sporklibrary:spork-android:*'
}
```

It's recommended to use the actual latest version instead of `*`

The last step is to initialize at least once. You can do this anywhere before calling `Spork.bind()`:

```java
SporkAndroid.initialize();
```

This registers all Android annotations with Spork. The best place to call this is in an Application class, but you can also call it in your `Activity` in an `onCreate()` method before `Spork.bind()`.


If want need to download the libraries manually, you can find them Spork [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion) and Spork-Android [here](https://bintray.com/sporklibrary/spork/spork-android/_latestVersion).

## Usage

Use `Spork.bind()` as follows:

- `Activity`: bind in `void onCreate(Bundle)`
- `Fragment`: bind in `void onViewCreated(View, Bundle)`
- `View`: bind in all constructors
- `Application`: bind in `void onCreate()`
- `Service`: bind in `void onCreate()`
- `ContentProvider`: bind in `boolean onCreate()`
- Components: bind in constructor

