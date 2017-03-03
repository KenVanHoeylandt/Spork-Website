# @BindComponent

Any class can become a component.

Components need to have a default constructor available (either specified or implied) with 0 or 1 arguments.

Components don't need to call `Spork.bind()` itself, but it is perfectly fine to do so.

This is the simplest component that you could create:

```java
public class Parent {
	@BindComponent
	private Child child;

	public Parent() {
		Spork.bind(this);
	}
}

public class Child {
}
```

## Base types and interfaces

You can inject to any assignable type, as long as you specify the implementation.

For example:

```java
@BindComponent(SomethingImplementation.class)
private SomethingInterface something;
```

## Scope

You can optionally specify a scope for `Child` by declaring in an annotation.

The default scope means that a new instance of the component is created for each time it is bound somewhere.

The singleton scope means that there will be at most 1 instance.

```java
@ComponentScope(ComponentScope.Scope.SINGLETON)
public class Child {
	// ...
}
```

## Parent

If you want to inject the component's parent, you can add it as a constructor parameter.
It is also not required to call Spork.bind() on the referenced component.

It's important that you always use the `@ComponentParent` annotation on the parameter.

```java
public class Child {
	final private Parent parent;

	public Child(@ComponentParent Parent parent) {
		this.parent = parent;
	}
}
```

The default scope creates a new instance for each binding.
