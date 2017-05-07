## Welcome

Welcome to the Spork documentation website. The menu on the left will cover all main Spork projects.

## Projects

### Main

- `spork`: the annotation processing core
- `spork-android` and `spork-android-support`: Android bindings similar to Butterknife
- `spork-inject`: dependency injectino similar to Dagger

### Support

Spork contains several support projects which are not published on jcenter, but are available in the [repository][support_projects]:

- `spork-android-example`: an example project of how to use Spork on Android
- `spork-benchmark`: Java benchmarks
- `spork-benchmark-android`: Android application with Java benchmarks
- `spork-matchers`: Hamcrest matchers for Spork tests
- `spork-proguard`: Test application for ProGuard (will be migrated to `spork-android-example` in the future)

## Migrating from 3.x

- repository is moved to jCenter with snapshots at http://dl.bintray.com/bytewelder/maven-snapshot
- base packages renamed from `io.github.sporklibrary` to `spork`
- `@BindComponent` is now `@Inject` and injection is done with dependencies defined by an `ObjectGraph` and its modules.
- `@ComponentScope(Scope.SINGLETON)` is now `@Singleton`
- removed custom support for `RecyclerView.ViewHolder` as you can now make it implement `ViewProvider`
- `FieldBinder`, `MethodBinder` and `TypeBinder` interfaces are changed

[support_projects]: https://github.com/ByteWelder/Spork/tree/master/support