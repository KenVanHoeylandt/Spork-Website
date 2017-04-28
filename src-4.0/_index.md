## Getting started on Android

**WARNING**: Spork 4.0 is only accessible as a snapshot release.<br/>This is not a final release and is subject to potential changes in its API.

Add the following dependencies in `build.gradle`:

```groovy
repositories {
    maven {
        url  "http://dl.bintray.com/bytewelder/maven-snapshot" 
    }
}

dependencies {
    // Spork Dependency Injection
    compile 'com.bytewelder.spork:spork-inject:4.0.0'

    // Spork for Android (pick one of the dependencies below)
    compile 'com.bytewelder.spork:spork-android:4.0.0@aar'
    compile 'com.bytewelder.spork:spork-android-support:4.0.0@aar'
}
```

## Getting started on Java

Add the following dependencies in `build.gradle`:

```groovy
dependencies {
    compile 'com.bytewelder.spork:spork-inject:4.0.0'
}
```

All dependencies are available at [Maven Central Repository](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22io.github.sporklibrary%22).

## Migrating from 3.x to 4.0:

- repository is moved to jCenter with snapshots at http://dl.bintray.com/bytewelder/maven-snapshot
- base packages renamed from `io.github.sporklibrary` to `spork`
- `@BindComponent` is now `@Inject` and injection is done with dependencies defined by an `ObjectGraph` and its modules.
- `@ComponentScope(Scope.SINGLETON)` is now `@Singleton`
- removed custom support for `RecyclerView.ViewHolder` as you can now make it implement `ViewProvider`
- `FieldBinder`, `MethodBinder` and `TypeBinder` interfaces are changed