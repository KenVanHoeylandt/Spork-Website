# Getting Started with Java

## Download

### Gradle

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
compile 'io.github.sporklibrary:spork:*'
```

It's recommended to use the actual latest version instead of `*`

### Maven

```xml
<dependency>
  <groupId>io.github.sporklibrary</groupId>
  <artifactId>spork</artifactId>
  <version>[VERSION]</version>
  <type>pom</type>
</dependency>
```

### Ivy

```xml
<dependency org='io.github.sporklibrary' name='spork' rev='[VERSION]'>
  <artifact name='$AID' ext='pom'></artifact>
</dependency>
```

### Manually

Download the dependencies [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion).
