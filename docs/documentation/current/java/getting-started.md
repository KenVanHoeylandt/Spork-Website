# Getting Started with Java

## Gradle

Edit your `build.gradle` file and add the repository:

```groovy
repositories {
    mavenCentral()
    maven {
        url "https://dl.bintray.com/sporklibrary/spork"
    }
}
```

The next step is to add dependencies:

```groovy
dependencies {
	compile 'io.github.sporklibrary:spork:3.0.1'
}
```

## Maven

```xml
<dependency>
  <groupId>io.github.sporklibrary</groupId>
  <artifactId>spork</artifactId>
  <version>3.0.1</version>
  <type>pom</type>
</dependency>
```

## Ivy

```xml
<dependency org='io.github.sporklibrary' name='spork' rev='3.0.1'>
  <artifact name='$AID' ext='pom'></artifact>
</dependency>
```

## Manually

Download the dependencies [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion).
