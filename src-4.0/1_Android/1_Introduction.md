# Spork for Android

Spork for Android has 2 packages:

- `spork-android` which provides all basic Android injection
- `spork-android-support` which provides injection for `android.support.v4.app.Fragment`

# Dependencies

Add the following dependencies in `build.gradle`:

```groovy
repositories {
    jcenter()
}

dependencies {
    // Spork for Android (pick one of the dependencies below)
    compile 'com.bytewelder.spork:spork-android:4.0.0@aar'
    compile 'com.bytewelder.spork:spork-android-support:4.0.0@aar'
}
```