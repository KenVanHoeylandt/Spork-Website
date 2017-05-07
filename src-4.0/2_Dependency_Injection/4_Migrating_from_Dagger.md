# Migrating from Dagger

These are the main differences between Dagger and Spork:

1. Components are replaced by `ObjectGraph` and also depends on module classes
2. `Provides` and `Lazy` classes are in the `spork.inject` package
3. No need to annotate your module classes with `@Module`
4. Spork is able to inject `private` fields and methods

Dagger annotations that Spork doesn't support (yet):

- `@Reusable`
- `@ForReleasableReferences`
- `@BindsOptionalOf`
- Multibindings (`@IntoSet`, `@IntoMap`)
- Producers (`@ProducerModule`, `@Produces`)