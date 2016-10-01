# Binding Order

Binding order is the same as the registration order of `FieldBinder`, `MethodBinder` and `TypeBinder`.

The practical order of binding is as follows:

1. Spork Java annotations (`@Inject`)
2. Spork Android annotations (automatically registered if dependency is present)
3. Custom registered annotations
