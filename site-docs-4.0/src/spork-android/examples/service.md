# Service

## Introduction

The following annotations are supported:

 - `@BindResource`
 - `@Inject`

## Example

```java
public class TestService extends Service {
	@BindResource(R.string.helloworld)
	private String helloWorld;

	public class LocalBinder extends Binder {
		public TestService getLocalService() {
			return TestService.this;
		}
	}

	@Override
	public void onCreate() {
		super.onCreate();
		Spork.bind(this);
	}

	@Override
	public @Nullable IBinder onBind(Intent intent) {
		return new LocalBinder();
	}
}
```