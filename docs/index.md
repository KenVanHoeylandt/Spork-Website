# Introduction

Spork is an annotation processing library to speed up development on your projects.
It allows you to write less boilerplate code to make your code more readable and maintainable.

Spork aims to be different by overcoming the shortcomings of its [alternatives](/about/comparison).

Spork comes in two flavors: [Spork for Android](https://github.com/SporkLibrary/Spork-Android) and [Spork for Java](https://github.com/SporkLibrary/Spork).

**Example:**

```java
@BindLayout(R.layout.activity_download)
public class DownloadActivity extends Activity
{
	@BindView(R.id.download_button)
	private Button mDownloadButton;

	@BindFragment(R.id.details_fragment)
	private DetailsFragment mFragment;

	@BindComponent
	private DownloadService mDownloadService;

	public void onCreate(Bundle savedInstanceState)
	{
		super.onCreate(savedInstanceState);

		Spork.bind(this); // Spork does its magic
	}

	@BindClick(R.id.other_button)
	private void onClickButton(Button someButton)
	{
		mDownloadService.download();
	}
}

@ComponentScope(scope = ComponentScope.Scope.SINGLETON)
public class DownloadService
{
	public void download() {}
}
```