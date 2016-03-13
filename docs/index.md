# Introduction

Spork is an annotation processing library to speed up development on your projects.
It allows you to write less boilerplate code to make your code more readable and maintainable.

Spork aims to be different by overcoming the shortcomings of its alternatives.

Spork comes in two flavors: [Spork for Android](https://github.com/SporkLibrary/Spork-Android) and [Spork for Java](https://github.com/SporkLibrary/Spork).

Advantages:

- **light-weight**: Spork is very small! Verify [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion) and [here](https://bintray.com/sporklibrary/spork/spork-android/_latestVersion) under "files"
- **extensible**: create your own annotations with little effort
- **no code generation** as opposed to [Android Annotations](http://androidannotations.org) or [Butter Knife](http://jakewharton.github.io/butterknife/)
- **no manual book-keeping** as opposed to [Dagger](http://square.github.io/dagger/) ObjectGraph/Modules)
- **no need to extend classess** from custom Activity/Fragment base class (as opposed to [RoboGuice](https://github.com/roboguice/roboguice))
- **test** your injected components by [mocking/stubbing](http://localhost:8000/documentation/testing/) them (even with custom mocking frameworks)

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