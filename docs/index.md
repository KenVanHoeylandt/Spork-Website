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

Example:

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

## Status

###Spork for Android
[![Spork for Android version][android-version-svg]][android-version-link]
[![Spork for Android coverage][android-coverage-svg]][android-coverage-link]

###Spork for Java
[![Spork for Java version][java-version-svg]][java-version-link]
[![Spork for Java coverage][java-coverage-svg]][java-coverage-link]

###Spork Mockito
[![Spork Mockito version][mockito-version-svg]][mockito-version-link]
[![Spork Mockito coverage][mockito-coverage-svg]][mockito-coverage-link]

[java-version-svg]: https://img.shields.io/bintray/v/sporklibrary/spork/spork.svg?style=flat
[java-version-link]: https://bintray.com/sporklibrary/spork/spork/_latestVersion
[java-coverage-svg]: https://coveralls.io/repos/github/SporkLibrary/Spork/badge.svg?branch=master
[java-coverage-link]: https://coveralls.io/github/SporkLibrary/Spork?branch=master
[android-version-svg]: https://img.shields.io/bintray/v/sporklibrary/spork/spork-android.svg?style=flat
[android-version-link]: https://bintray.com/sporklibrary/spork/spork-android/_latestVersion
[android-coverage-svg]: https://coveralls.io/repos/github/SporkLibrary/Spork-Android/badge.svg?branch=master
[android-coverage-link]: https://coveralls.io/github/SporkLibrary/Spork-Android?branch=master
[mockito-version-svg]: https://img.shields.io/bintray/v/sporklibrary/spork/spork-mockito.svg?style=flat
[mockito-version-link]: https://bintray.com/sporklibrary/spork/spork-mockito/_latestVersion
[mockito-coverage-svg]: https://coveralls.io/repos/github/SporkLibrary/Spork-Mockito/badge.svg?branch=master
[mockito-coverage-link]: https://coveralls.io/github/SporkLibrary/Spork-Mockito?branch=master
