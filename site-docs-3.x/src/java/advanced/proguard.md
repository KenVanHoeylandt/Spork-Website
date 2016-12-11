# ProGuard

ProGuard's shrinking process might remove your components, because they are instantiated by reflection instead of the regular way. To avoid this, you need to specify the classes and interfaces to keep in your proguard configuration.

## Example

```java
-keep class com.yourapp.components.** { *; }
-keep interface com.yourapp.components.** { *; }
```