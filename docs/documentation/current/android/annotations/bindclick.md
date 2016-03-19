# @BindClick

Click binding works within `Activity`, `Fragment`, `android.support.v4.app.Fragment`, `View` and `RecyclerView.ViewHolder`. The `View` can optionally be specified in the method as argument.

The method can be either without arguments or with exactly 1 argument that accepts any class or subclass that is compatible with the bound view.

## Example

```java
public class MyActivity extends Activity
{
	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);
	}

	// Bind by specified id
	@BindClick(R.id.first_button)
	private void onClickMyButton()
	{
	}

	// Bind by implied id (method name)
	@BindClick
	private void second_button(Button button)
	{
	}
}
```