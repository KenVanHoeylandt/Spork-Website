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
	compile 'io.github.sporklibrary:spork:*'
}
```

It's recommended to use the actual latest version instead of `*`

## Maven

```xml
<dependency>
  <groupId>io.github.sporklibrary</groupId>
  <artifactId>spork</artifactId>
  <version>[VERSION]</version>
  <type>pom</type>
</dependency>
```

## Ivy

```xml
<dependency org='io.github.sporklibrary' name='spork' rev='[VERSION]'>
  <artifact name='$AID' ext='pom'></artifact>
</dependency>
```

## Manually

Download the dependencies [here](https://bintray.com/sporklibrary/spork/spork/_latestVersion).

## Status

[![Spork for Java version][java-version-svg]][java-version-link]
[![Spork for Java coverage][java-coverage-svg]][java-coverage-link]

[java-version-svg]: https://img.shields.io/bintray/v/sporklibrary/spork/spork.svg?style=flat
[java-version-link]: https://bintray.com/sporklibrary/spork/spork/_latestVersion
[java-coverage-svg]: https://coveralls.io/repos/github/SporkLibrary/Spork/badge.svg?branch=master
[java-coverage-link]: https://coveralls.io/github/SporkLibrary/Spork?branch=master
