# Spork Android

## Introduction

Spork Android contains 2 packages:

- `spork-android` which provides all basic Android injection
- `spork-android-support` which provides injection for `android.support.v4.app.Fragment`

## Dependencies

Add the following dependencies in `build.gradle`:

```groovy
dependencies {
    compile 'io.github.sporklibrary:spork:4.0.0'
    compile 'io.github.sporklibrary:spork-android:4.0.0@aar'
	compile 'io.github.sporklibrary:spork-android-support:4.0.0@aar'  // optional
}
```