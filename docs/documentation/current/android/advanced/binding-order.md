# Binding Order

Components are bound by the order they are registered in. This means that components are bound first and any other registered annotations are bound after that.

## Components 

When `Spork.bind()` is called, the `@BindComponent` annotations are processed first. This means that when the component is bound, the `@ComponentParent` passed in the constructor can be acccessed, but the injection on `@ComponentParent` fields might not have finished.

### Example

```java
public class ExampleActivity extends Activity
{
	@BindComponent
	private Component mComponent;

	@BindView(R.id.test)
	private View mView;

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);
	}

	public View getView()
	{
		return mView;
	}
}

public class Component
{
	public Component(@ComponentParent ExampleActivity activity)
	{
		// at this point, activity.getView() will still return null
	}
}
```

### Solution 1

Store the component parent and access its properties only by reference.

```java
public class ExampleActivity extends Activity
{
	// ...
}

public class Component
{
	private final ExampleActivity mActivity;

	public Component(@ComponentParent ExampleActivity activity)
	{
		mActivity = activity;
	}

	public void show()
	{
		// as long as show() is called after the parent's
		// Spork.bind() then all is fine
		activity.getView().setVisibility(View.VISIBLE);
	}
}
```

### Solution 2

Cache the fields when any of the component methods are called.

```java
public class ExampleActivity extends Activity
{
	// ...
}

public class Component
{
	private final ExampleActivity mActivity;

	private View mView;

	public Component(@ComponentParent ExampleActivity activity)
	{
		mActivity = activity;
	}

	public void show()
	{
		assureViewsCached();

		mView.setVisibility(View.VISIBLE);
	}

	private void assureViewsCached()
	{
		if (mView == null)
		{
			mView = activity.getView();
		}
	}
}
```

### Solution 3

Give your component an initializing method and call it after the parent's `Spork.bind()`

```java
public class ExampleActivity extends Activity
{
	// ...

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);

		mComponent.initialize(); // initialization after binding finished
	}

	// ...
}

public class Component
{
	private final ExampleActivity mActivity;

	public Component(@ComponentParent ExampleActivity activity)
	{
		mActivity = activity;
	}

	public void initialize()
	{
		// Cache view
		mView = activity.getView();
	}
}
```

### Inheritance

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
