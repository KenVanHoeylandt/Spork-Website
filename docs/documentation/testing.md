# Testing

Spork provides basic support for unit-testing. Specifically for creating mock/stub classes for components.

## Standard mocking

The default implementation for mocks/stubs with Spork is by injecting alternative classes into objects:

```
// Create a ComponentFactory for mocking
MockingComponentFactory mocking_factory = new MockingComponentFactory()
	.register(RegularImplementationA.class, MockedImplementationA.class)
	.register(RegularImplementationB.class, MockedImplementationB.class);
// Assign the new ComponentFactory
ComponentInstanceManager.setComponentFactory(mocking_factory);
```

That's it! Instead of injecting `RegularImplementation*` classes, `MockedImplementation*` classes will be instantiated and injected instead!

## Mockito support

### Configuration

To enable Mockito support, add the following dependency:

```
dependencies {
	compile ('io.github.sporklibrary:spork-mockito:*') {
		exclude group: 'io.github.sporklibrary'
	}
}
```

It's recommended to use the actual latest version instead of `*`

### Example

Consider the following classes:

```
public class Component
{
	public int getValue()
	{
		return 1;
	}
}

public class Parent
{
	@BindComponent
	private Component mComponent;

	public Parent()
	{
		Spork.bind(this);
	}

	public Component getComponent()
	{
		return mComponent;
	}
}
```

To start mocking, this needs to be done:

```
// Enable mocking for the specified class(es)
SporkMockito.initialize(Component.class);
// This can be called multiple times to reset the mocking classes.
// Alternatively, mocking can be enabled for all component classes with:
// SporkMockito.initialize()

// Object instantiation
Parent mocked_parent = new Parent();
Component mocked_component = mocked_parent.getComponent();

// Run Mockito tests
assertEquals("mocked default value", 0, mocked_component.getValue());
when(mocked_component.getValue()).thenReturn(2);
assertEquals("mocked overridden value", 2, mocked_component.getValue());
```

## Custom mocking

It's possible to implement your own mocking behavior.

All you need to do is implement your own `ComponentFactory` and implement the required methods:

```
public class CustomMockingComponentFactory implements ComponentFactory
{
	@Override
	public Object create(Class<?> classObject, Object parent)
	{
		return CustomMockingFramework.mock(classObject);
	}
}
```

All that is left is registering it:

```
ComponentInstanceManager.setComponentFactory(custom_component_factory);
```