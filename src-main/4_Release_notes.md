# 4.0.0

- all package versions are from now on bumped to the same version when a release is done
- most packages are moved (and created `.internal` package)
- `Spork`/`SporkAndroid`/`SporkAndroidSupport` can now be instantiated (but a shared instance is available for Spork itself which suits most scenarios)
- `@ComponentScope(Scope.SINGLETON)` is now `@Singleton`
- `spork-android` library now uses `support-fragment` dependency instead of `support-v4` and `appcompat-v7`
- created `ViewProvider` to annotate POJO classes so they can work with `@BindView`
- removed custom support for `RecyclerView.ViewHolder` as you can now make it implement `ViewProvider`
- `BindResourceBinder` now uses newer Android API when possible
- caching is now flattened (removed custom models that held a separate layer of caching)
- caching uses less memory (`ArrayList.trimToSize()` where applicable)
- `spork` and `spork-android` now have an extension system to automatically load known dependencies: this is simpler (more reliable) and quicker
- updated to use new Android build tools
- improved tests and also started using Mockito
- `FieldBinder`, `MethodBinder` and `TypeBinder` are now more simplified
- removed logback from tests (because it wasn't being used)
- converted spaces into tabs where necessary
- implemented `@Inject`, `@Nullable`, `@NonNull` and `@Lazy` annotations
- `@BindComponent` and `@ComponentScope` are removed
- added jacoco for code coverage
- added dexcount plugin for `spork-android` and `spork-android-support`

# Old Release Notes

## spork 3.2.0

- new Spork Android init code

## spork 3.1.0

- removed logging dependency (slf4j)

## spork 3.0.0

- refactored annotation binding internals including a new and more effective caching mechanism
- javadoc improvements

## spork 2.6.0

- automatically register Spork Android bindings
- javadoc improvements

## spork 2.5.0

- implemented support for binding with inheritance

## spork 2.4.1

- javadoc improvements

## spork 2.4.0

- `BindComponent` annotation now uses `value()` instead of `implementation()`
- implemented support for custom component factories to do mocking/stubbing

## spork 2.3.0

- disabled recursive component binding

## spork 2.2.0

- fix for pre-JDK1.8 issue when binding components

## spork 2.1.0

- moved some classes into new namespaces
- created `ComponentParent` annotation

## spork 2.0.0

- added support for type binding
- javadoc improvements

## spork-android 3.0.0

- updated Spork core to 3.0.0
- split up into `spork-android` and `spork-android-support`
- introduced new package name `io.github.sporklibrary.android`

## spork-android 2.4.2

- added ProGuard file

## spork-android 2.4.1

- implemented a better way to check for optional dependencies

## spork-android 2.4.0

- upgraded to Spork core 3.0.0
- javadoc improvements

## spork-android 2.3.0

- `SporkAndroid.initialize()` is now deprecated and doesn't have to be called anymore
- added support for `android.support.v7.widget.RecyclerView` binding
- added support for `io.github.sporklibrary.interfaces.ContextProvider` interface
- updated support libraries
- gradle-wrapper upgraded to 2.10
- code corectness changes
- javadoc improvements

## spork-android 2.2.2

- better test coverage

## spork-android 2.2.1

- upgraded to Spork core 2.5.0

## spork-android 2.2.0

- upgraded build tools to 23.0.2
- upgraded to Spork 2.4.0

## spork-android 2.1.0

- upgraded to Spork 2.3.0
- register BindLayoutBinder first (because other binders depend on it)
- javadoc improvements

## spork-android 2.0.0

- added support for AppCompatActivity and support Fragments (support-v4, appcompat-v7)
- upgraded to spork 2.2.0 to fix issue with components in relation to JDK 1.8 features

Older version history is not available.