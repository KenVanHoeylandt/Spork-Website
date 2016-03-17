# Advanced Topics

## Component inheritance

When extending classes, you should only call `Spork.bind()` in the base class where you want to apply bindings. All derived classes will automatically get bound too.

Injection for classes that apply inheritance happens from the most top-level class to the bottom level base class.

```java
class ComponentBase
{
	public ComponentBase()
	{
		Spork.bind(this);
	}
}

class Component extends ComponentBase
{
	@BindComponent
	private SomeOtherComponent mSomeOtherComponent;

	// No need to call Spork.bind() because superclass handles that
}

class Parent
{
	@BindComponent
	private Component mComponent;

	public Parent()
	{
		// Component is injected and both Component and ComponentBase
		// annotations are processed
		Spork.bind(this);
	}
}
```

## ProGuard

ProGuard's shrinking process might remove your components, because they are instantiated by reflection instead of the regular way. To avoid this, you need to specify the classes and interfaces to keep in your proguard configuration.

For example:

```java
-keep class com.yourapp.components.** { *; }
-keep interface com.yourapp.components.** { *; }
```