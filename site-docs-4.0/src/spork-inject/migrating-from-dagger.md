# Migrating from Dagger

These are the main differences between Dagger and Spork:

1. You need to call `Spork.bind()` in your object's constructor or initialization method.
2. `@Provides` is found within the Spork namespace.
3. No need to annotate your module classes.
4. Components are replaced by `ObjectGraph`.
5. Spork is able to inject `private` fields.
6. Lazy injection is done by using `javax.inject.Provider`. Ther is no `@Lazy` annotation.
