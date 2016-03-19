# @BindFragment

Fragment binding works within classes derived from `android.app.Fragment`, `android.support.v4.app.Fragment` and `Activity`.

Binding a fragment is done by specifying its id.

## Example

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
