## Introduction

Spork for Android allows you to write less Android boilerplate code so you can focus on the more importants parts when writing applications.

Spork for Android dependencies come in 2 flavors:

- `spork-android` which provides all basic Android injection
- `spork-android-support` which provides injection for `android.support.v4.app.Fragment`

## Dependencies

All dependencies are published to jcenter.

When **not** using AppCompat/Support libraries:
```groovy
dependencies {
    compile 'com.bytewelder.spork:spork-android:4.0.0@aar'
}
```

When using AppCompat/Support libraries:
```groovy
dependencies {
    compile 'com.bytewelder.spork:spork-android-support:4.0.0@aar' {
        exclude group: 'com.android.support'
    }
}
```

## Example

```java
@BindLayout(R.layout.activity_download)
public class YourActivity extends Activity {

    @BindView(R.id.your_button)
    private Button button;

    @BindFragment(R.id.your_fragment)
    private DetailsFragment fragment;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Spork.bind(this);
    }

    @BindClick(R.id.other_button)
    private void onClickButton(Button button) {
        // handle click
    }
}
```