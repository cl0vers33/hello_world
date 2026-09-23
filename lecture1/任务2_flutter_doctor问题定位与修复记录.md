# 自主实践任务2：flutter doctor 问题定位与修复记录

## 问题一：Gradle 下载 SSL 证书验证失败

### 现象

在 Android 模拟器上运行 `flutter run -d emulator-5554` 时，Gradle 构建失败，报错：

```
Exception in thread "main" javax.net.ssl.SSLHandshakeException: PKIX path building failed:
sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
...
Running Gradle task 'assembleDebug'...                           1,363ms
Error: Gradle task assembleDebug failed with exit code 1
```

### 定位

1. 报错发生在 Gradle wrapper 尝试下载 Gradle 发行版阶段（`org.gradle.wrapper.Download.downloadInternal`）。
2. 查看 `android/gradle/wrapper/gradle-wrapper.properties`，默认 `distributionUrl` 指向 `https://services.gradle.org/distributions/gradle-9.3.1-all.zip`。
3. Java 的 truststore 无法验证 `services.gradle.org` 的 SSL 证书链（国内网络环境常出现此问题，可能由代理或防火墙截留 SSL 引起）。

### 解决

将 `distributionUrl` 改为腾讯云镜像：

```properties
# 修改前
distributionUrl=https\://services.gradle.org/distributions/gradle-9.3.1-all.zip
# 修改后
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-9.3.1-all.zip
```

同时在 `android/settings.gradle.kts` 的 `repositories` 块中前置阿里云 Maven 镜像：

```kotlin
repositories {
    maven { url = uri("https://maven.aliyun.com/repository/google") }
    maven { url = uri("https://maven.aliyun.com/repository/central") }
    maven { url = uri("https://maven.aliyun.com/repository/gradle-plugin") }
    google()
    mavenCentral()
    gradlePluginPortal()
}
```

### 验证

再次运行 `flutter run -d emulator-5554`，Gradle 发行版从腾讯镜像成功下载，Maven 依赖从阿里云镜像拉取，构建进入编译阶段，SSL 报错不再出现。

---

## 问题二：项目路径含非 ASCII 字符

### 现象

修复 SSL 问题后，Gradle 构建再次失败，报错：

```
* What went wrong:
An exception occurred applying plugin request [id: 'com.android.application']
> Failed to apply plugin 'com.android.internal.application'.
   > Your project path contains non-ASCII characters. This will most likely cause the build to fail on Windows.
     Please move your project to a different directory.
     See http://b.android.com/95744 for details.
```

### 定位

1. 项目路径为 `C:\Users\asus\Desktop\作业\移动应用开发实践\课程1\hello_world`，其中"作业""移动应用开发实践""课程1"均为中文。
2. Android Gradle Plugin 对路径做 ASCII 检查，中文路径触发警告并中止构建。
3. 这正是实践指南第三章"翻车警告"提到的现象："解压路径含中文或空格会在后续构建时产生诡异报错。"

### 解决

按报错提示，在 `android/gradle.properties` 中追加一行覆盖路径检查：

```properties
android.overridePathCheck=true
```

> 注：理想做法是将项目移至纯英文路径。此处为保留课程目录结构，使用官方提供的覆盖开关。

### 验证

再次运行 `flutter run -d emulator-5554`，Gradle 构建通过，应用在模拟器上成功启动，日志出现 `D/ProfileInstaller: Installing profile for com.example.hello_world`，界面渲染计数器示例。

---

## 小结

| 序号 | 问题 | 根因 | 修复 |
|------|------|------|------|
| 1 | Gradle 下载 SSL 握手失败 | Java truststore 不识别 services.gradle.org 证书 | 切换腾讯云 Gradle 镜像 + 阿里云 Maven 镜像 |
| 2 | 路径含中文被 AGP 拒绝 | 项目路径含非 ASCII 字符 | 添加 `android.overridePathCheck=true` |
