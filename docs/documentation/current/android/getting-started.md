# Getting Started on Android

## Download

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
dependencies {
    compile 'io.github.sporklibrary:spork-android:2.4.2'
}
```

If want need to download the libraries manually, you can find the Spork core [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion) and Spork for Android [here](https://bintray.com/sporklibrary/spork/spork-android/_latestVersion).

## Usage

Use `Spork.bind()` as follows:

- `Activity`: bind in `void onCreate(Bundle)`
- `Fragment`: bind in `void onViewCreated(View, Bundle)`
- `View`: bind in all constructors
- `Application`: bind in `void onCreate()`
- `Service`: bind in `void onCreate()`
- `ContentProvider`: bind in `boolean onCreate()`
- Components: bind in constructor