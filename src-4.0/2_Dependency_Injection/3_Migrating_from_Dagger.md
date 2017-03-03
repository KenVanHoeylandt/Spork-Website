# Migrating from Dagger

These are the main differences between Dagger and Spork:

1. Components are replaced by `ObjectGraph` and also depends on module classes
2. You need to call `Spork.bind(this, objectGraph)` in your object's constructor or initialization method
3. `Provides` and `Lazy` classes are in the `spork.inject` package
4. No need to annotate your module classes with `@Module`
5. Spork is able to inject `private` fields and methods

Dagger annotations that Spork doesn't support (yet):

- `@Reusable`
- `@ForReleasableReferences`
- `@BindsOptionalOf`