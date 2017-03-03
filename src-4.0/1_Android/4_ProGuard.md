# ProGuard & DexGuard

ProGuard's shrinking process might remove your components, because they are instantiated by reflection instead of the regular way. To avoid this, you need to specify the classes and interfaces to keep in your proguard configuration.

This includes:

- Any injected dependencies with `@Inject`
- Modules

Spork itself already includes a ProGuard file that keeps all Spork-related classes.
Spork is very lightweight, so the impact on your method and field count will be very limited.

## Example

You can ensure that your classes and interfaces are kept as follows:

```java
-keep class com.yourapp.modules.** { *; }
-keep interface com.yourapp.interfaces.** { *; }
```