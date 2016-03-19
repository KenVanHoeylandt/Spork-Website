# @BindView

View binding works with classes derived from `Activity`, `Fragment`, `android.support.v4.app.Fragment`, `View` and `RecyclerView.ViewHolder`.

## Example

```java
public class MyActivity extends Activity
{
	// Bind by specified id
	@BindView(R.id.my_button)
	private Button mButton;

	// Bind by implied id (field name)
	@BindView
	private Button button;

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this);
	}
}
```