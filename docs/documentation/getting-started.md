# Getting Started

## Android Installation

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

## Android Usage

Use `Spork.bind()` as follows:

- `Activity`: bind in `void onCreate(Bundle)`
- `Fragment`: bind in `void onViewCreated(View, Bundle)`
- `View`: bind in all constructors
- `Application`: bind in `void onCreate()`
- Components: bind in all constructors

## Java Installation

Edit your `build.gradle` file and add the repository:

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
compile 'io.github.sporklibrary:spork:*'
```

It's recommended to use the actual latest version instead of `*`

## Direct downloads

Download the dependencies here:

- [Spork for Java](https://bintray.com/sporklibrary/spork/spork/_latestVersion)
- [Spork for Android](https://bintray.com/sporklibrary/spork/spork-android/_latestVersion)
