# Spork Android

## Introduction

Spork Android contains 2 packages:

- `spork-android` which provides all basic Android injection
- `spork-android-support` which provides injection for `android.support.v4.app.Fragment`

## Dependencies

Add the following dependencies in `build.gradle`:

```groovy
repositories {
	jcenter()
}

dependencies {
	// Spork core
    compile 'com.bytewelder.spork:spork:4.0.0'

    // Spork for Android (second line is optional)
    compile 'com.bytewelder.spork:spork-android:4.0.0@aar'

    // Spork for Android: support libraries (optional)
    compile 'com.bytewelder.spork:spork-android-support:4.0.0@aar'
}
```