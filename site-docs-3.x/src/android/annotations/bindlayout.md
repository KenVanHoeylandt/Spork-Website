# @BindLayout

This annotation can be used with classes derived from:

- android.app.`Activity`
- android.view.`ViewGroup`

When using it for `ViewGroup`, a `FrameLayout` is preferred as the inflated layout will be added as a child to it.

## Example: Activity

```java
@BindLayout(R.layout.activity_custom)
public class CustomActivity extends Activity {

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Spork.bind(this);
	}
}
```

## Example: ViewGroup

```java
@BindLayout(R.layout.view_custom)
public class CustomView extends FrameLayout {
	
	public MyView(Context context) {
		super(context);
		Spork.bind(this);
	}
}
```
