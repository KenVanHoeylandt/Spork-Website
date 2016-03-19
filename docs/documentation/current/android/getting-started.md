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
    compile 'io.github.sporklibrary:spork-android:*'
}
```

It's recommended to use the actual latest version instead of `*`


If want need to download the libraries manually, you can find the Spork core [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion) and Spork for Android [here](https://bintray.com/sporklibrary/spork/spork-android/_latestVersion).

[![Spork for Android version][android-version-svg]][android-version-link]
[![Spork for Android coverage][android-coverage-svg]][android-coverage-link]

## Usage

Use `Spork.bind()` as follows:

- `Activity`: bind in `void onCreate(Bundle)`
- `Fragment`: bind in `void onViewCreated(View, Bundle)`
- `View`: bind in all constructors
- `Application`: bind in `void onCreate()`
- `Service`: bind in `void onCreate()`
- `ContentProvider`: bind in `boolean onCreate()`
- Components: bind in constructor

[android-version-svg]: https://img.shields.io/bintray/v/sporklibrary/spork/spork-android.svg?style=flat
[android-version-link]: https://bintray.com/sporklibrary/spork/spork-android/_latestVersion
[android-coverage-svg]: https://coveralls.io/repos/github/SporkLibrary/Spork-Android/badge.svg?branch=master
[android-coverage-link]: https://coveralls.io/github/SporkLibrary/Spork-Android?branch=master

