# View

## Introduction

When creating a custom view, it's best to extend a `FrameLayout`, because `@BindLayout` will inflate the specified layout into it.

The following annotations are supported:

 - `@BindClick`
 - `@BindView`
 - `@BindLayout`
 - `@BindResource`
 - `@BindComponent`

## Example

```java
@BindLayout(R.layout.view_layout_binding)
public class MyView extends FrameLayout
{
	@BindView(R.id.some_textview)
	private TextView mTextView;

	@BindComponent
	private DownloadService mDownloadService;

	public MyView(Context context)
	{
		super(context);
		
		// Note: Spork.bind() must be called in 
		// all constructors that are implemented!
		Spork.bind(this);
	}

	@BindClick(R.id.download_button)
	private void onClickDownload()
	{
		mDownloadService.download();
	}

	// BindClick can also pass the button that was clicked
	@BindClick(R.id.other_button)
	private void onClickOtherButton(Button otherButton)
	{
		mDownloadService.download();
	}
}
```