# Introduction

Spork is an annotation processing library to speed up development on your projects.
It allows you to write less boilerplate code to simplify your applications.

Spork aims to be different by overcoming the shortcomings of its alternatives.

Spork comes in two flavors: [Spork for Android](https://github.com/SporkLibrary/Spork-Android) and [Spork for Java](https://github.com/SporkLibrary/Spork).

Advantages

- **light-weight**: only one small external dependency (slf4j-api)
- **extensible**: create your own annotations with little effort (`@BindLayout` is less than 50 lines of code!)
- **no code generation** (as opposed to [Android Annotations](http://androidannotations.org) or [Butter Knife](http://jakewharton.github.io/butterknife/))
- **no manual book-keeping** (as opposed to [Dagger](http://square.github.io/dagger/) ObjectGraph/Modules)
- **no need to extend classess** from custom Activity/Fragment base class (as opposed to [RoboGuice](https://github.com/roboguice/roboguice))

Disadvantages

- code-generating alternatives are faster (but the difference shouldn't be noticable)
- not as feature-rich (yet)

# Example
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