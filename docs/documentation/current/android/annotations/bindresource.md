# @BindResoure

Resource binding works within `Application`, `Activity`, `Fragment`, `Fragment`, `View` and `RecyclerView.ViewHolder`.

It can bind:
- `R.dimen.*` to `Float` or `float` fields
- `R.string.*` to `String` fields
- `R.drawable.*` to `Drawable` fields

## Example

```java
public class MyActivity extends Activity 
{
	// Bind by specified id
	@BindResource(R.string.app_name)
	private String mAppName;
	
	// Bind by implied id ("app_name")
	@BindResource
	private String app_name;
	
	@BindResource(R.dimen.spork_test_dimension)
	private float mSporkTestDimension;
	
	@BindResource
	private Float spork_test_dimension;
	
	@BindResource(R.drawable.spork_test_drawable)
	private Drawable mSporkTestDrawable;
	
	@BindResource
	private Drawable spork_test_drawable;

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);
	}
}
```