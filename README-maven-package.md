# README - Use Maven package from Github packages

## 1. Declare Maven registry inside POM

Look `distributionManagement` section in POM.

## 2. Use as a dependency in another project

See https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-apache-maven-registry

An example for `~/.m2/settings.xml`:

```xml
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">

  <activeProfiles>
    <activeProfile>github</activeProfile>
  </activeProfiles>

  <profiles>
    <profile>
      <id>github</id>
      <repositories>
        <repository>
          <id>central</id>
          <url>https://repo1.maven.org/maven2</url>
        </repository>
        <repository>
          <id>hello-octapus</id>
          <url>https://maven.pkg.github.com/drmalex07/hello-octapus</url>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>

  <servers>
    <server>
      <id>hello-octapus</id>
      <username>drmalex07</username>
      <!-- A personal access token (PAT) with read permissions on the Github repo --> 
      <password>github_pat_1234567890</password>
    </server>
  </servers>
</settings>
```
