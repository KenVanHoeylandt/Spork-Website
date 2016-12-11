# Spork 4.0

### Getting started on Android

Add the following dependencies in `build.gradle`:

```groovy
dependencies {
    compile 'io.github.sporklibrary:spork:4.0.0'
    compile 'io.github.sporklibrary:spork-android:4.0.0@aar'

    // The following dependency is optional.
    // It requires you to also add: appcompat-v7, support-v4, recyclerview-v7
	compile 'io.github.sporklibrary:spork-android-support:4.0.0@aar' 
}
```

### Getting started on Java

Add the following dependencies in `build.gradle`:

```groovy
dependencies {
    compile 'io.github.sporklibrary:spork:4.0.0'
}
```

All dependencies are available at [Maven Central Repository](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22io.github.sporklibrary%22).

### Migrating from 3.x to 4.0:

- base packages moved from `io.github.sporklibrary` to `spork`
- `@BindComponent` is now `@Inject` (with support for `@Nullable`, `@NonNull` and `@Lazy` annotations)
- `@ComponentScope(Scope.SINGLETON)` is now `@Singleton`
- removed custom support for `RecyclerView.ViewHolder` as you can now make it implement `ViewProvider`
- `FieldBinder`, `MethodBinder` and `TypeBinder` interfaces are changed