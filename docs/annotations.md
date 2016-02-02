# Spork for Java

The Spork for Java components are of course also available on Spork on the Android platform.

### @BindComponent

Any Java object can become a component. Components can be easily bound anywhere.
Classes need a `@Component` annotation to enable `@BindComponent` usage for them.

For example:

```java
public class Parent
{
	@BindComponent
	private Child child;

	public Parent()
	{
		Spork.bind(this);
	}
}

@Component
public class Child
{
}
```

The component scope can be customized: `@Component(scope = Component.Scope.SINGLETON)`

The default scope creates a new instance for each binding.

You can also inject to a base class or interface as long as you specify the implementation. For example:

```java
@BindComponent(implementation = SomeServiceImplementation.class)
private SomeService mService;
```

# Spork for Android

### @BindView

View binding works with classes derived from `Activity`, `Fragment` and `View`.

```java
public class MyActivity extends Activity
{
	// Bind by ID
	@BindView(R.id.my_button)
	private Button mButton;

	// Bind by field name
	@BindView
	private Button button;

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);
	}
}
```

### @BindFragment

Fragment binding works with classes derived from `Fragment`. The v4 support library Fragments are not yet supported.

```java
public class MyActivity extends Activity
{
	@BindFragment(R.id.my_fragment)
	private Fragment mFragment;

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		
		Spork.bind(this);
	}
}
```

### @BindClick

Click binding works within `Activity`, `Fragment` and `View`. It works with `View` as a target.

The method can be either without arguments or with exactly 1 argument that accepts any class or subclass that is compatible with the bound view.

```java
public class MyActivity extends Activity
{
	// Bind by ID
	@BindClick(R.id.first_button)
	private void onClickMyButton()
	{
	}

	// Bind by method name and accept Button as parameter
	@BindClick
	private void second_button(Button button)
	{
	}

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);
	}
}
```

### @BindResoure

Resource binding works within `Application`, `Activity`, `Fragment` and `View`.

It can bind:
- `R.dimen.*` to `Float` or `float` fields
- `R.string.*` to `String` fields
- `R.drawable.*` to `Drawable` fields

```java
public class MyActivity extends Activity 
{
	@BindResource(R.string.app_name)
	private String mAppName;
	
	@BindResource(R.string.app_name)
	private String app_name;
	
	@BindResource(R.dimen.spork_test_dimension)
	private float mSporkTestDimension;
	
	@BindResource
	private Float spork_test_dimension;
	
	@BindResource(R.drawable.spork_test_drawable)
	private Drawable mSporkTestDrawable;
	
	@BindResource
	private Drawable spork_test_drawable;
	
	@BindFragment(R.id.resourcebindingfragment)
	private TestFragment mResourceBindingFragment;
	
	@BindView(R.id.resourcebindingview)
	private TestView mResourceBindingView;

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);
	}
}
```

### @BindLayout

Layout binding works with `Activity` and `ViewGroup` classes.
When using it for `ViewGroup`, a `FrameLayout` is preferred as the layout will be added as a child to it.

```java
@BindLayout(R.layout.activity_custom)
public class CustomActivity extends Activity
{
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);
		
		Spork.bind(this);
	}
}
```

```java
@BindLayout(R.layout.view_custom)
public class CustomView extends FrameLayout
{
	public MyView(Context context)
	{
		super(context);

		Spork.bind(this);
	}
}
```
