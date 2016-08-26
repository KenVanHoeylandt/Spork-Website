# @BindResoure

This annotation can be used with classes derived from:

- android.app.`Activity`
- android.app.`Application`
- android.app.`Fragment`
- android.app.`Service`
- android.content.`ContentProvider`
- android.support.v4.app.`Fragment`
- android.support.v7.widget.`RecyclerView.ViewHolder`
- android.view.`View`
- io.github.sporklibrary.interfaces.`ContextProvider`

It can bind:

- `R.dimen.*` to `Float` or `float` fields
- `R.string.*` to `String` fields
- `R.drawable.*` to `Drawable` fields

You can bind a resource by specifying its id:

```java
@BindResource(R.string.app_name)
private String appName;
```

Alternatively, you can imply the view id by the field name:

```java
@BindResource
private String app_name;
```

## Example

```java
public class MyActivity extends Activity {

	@BindResource(R.string.app_name)
	private String appName;
	
	@BindResource
	private String app_name;
	
	@BindResource(R.dimen.spork_test_dimension)
	private float sporkTestDimension;
	
	@BindResource
	private Float spork_test_dimension;
	
	@BindResource(R.drawable.spork_test_drawable)
	private Drawable sporkTestDrawable;
	
	@BindResource
	private Drawable spork_test_drawable;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Spork.bind(this);
	}
}
```