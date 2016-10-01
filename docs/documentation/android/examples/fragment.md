# Fragment

## Introduction

You can also use `android.support.v4.app.Fragment` if you add the `spork-android-support` dependency.

The following annotations are supported:

 - `@BindClick`
 - `@BindView`
 - `@BindResource`
 - `@BindFragment`
 - `@Inject`

## Example

```java
public class MyFragment extends Fragment {
	
	@BindView(R.id.some_textview)
	private TextView myTextView;

	@Override
	public View onCreateView(LayoutInflater inflater,
		@Nullable ViewGroup container, Bundle savedInstanceState) {
		return inflater.inflate(R.layout.fragment_click_binding, container);
	}

	@Override
	public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
		Spork.bind(this);
	}

	@BindClick(R.id.some_button)
	private void onClick() {
		// click-handling code goes here
	}
}
```