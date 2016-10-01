# @BindFragment

This annotation can be used with classes derived from:

- android.app.`Activity`
- android.app.`Fragment`
- android.support.v4.app.`Fragment` (with the `spork-android-support` dependency)

You can bind a fragment by specifying its id:

```java
@BindFragment(R.id.my_fragment)
private Fragment myFragment;
```

Alternatively, you can imply the fragment id by the field name:

```java
@BindFragment
private Fragment my_fragment;
```