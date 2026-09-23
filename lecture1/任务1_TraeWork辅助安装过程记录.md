# 自主实践任务1：TraeWork辅助安装过程记录

> 三要素：指令、结果、验证

## 一、安装目标

在 Windows 11 上搭建 Flutter 开发环境，支持 Web、Android 模拟器、Windows 桌面三端运行。

## 二、过程记录（指令 / 结果 / 验证）

### 步骤1：向 TraeWork 描述目标

- **指令**：向 TraeWork 输入"帮我在这台 Windows 电脑上安装 Flutter 开发环境，计划在 Android 模拟器、Windows 桌面和 Web 端运行应用。"
- **结果**：TraeWork 给出分步方案：下载 SDK、解压、配置环境变量、配置国内镜像。
- **验证**：方案与官方文档 https://docs.flutter.dev/get-started/install 一致。

### 步骤2：验证 Flutter 是否已安装

- **指令**：`flutter --version`
- **结果**：
  ```
  Flutter 3.47.2 • channel stable • https://gitee.com/mirrors/flutter.git
  Framework • revision d3b14c8769 (3 weeks ago) • 2026-08-26 16:07:51 -0700
  Engine • hash 1cf1c4773fb941c4c74a7f8bb144a8837596c0f4
  Tools • Dart 3.13.2 • DevTools 2.60.0
  ```
- **验证**：版本号正常输出，说明 Flutter SDK 已在 PATH 中，环境变量生效。

### 步骤3：配置国内镜像环境变量

- **指令**：在系统环境变量中设置
  - `PUB_HOSTED_URL=https://pub.flutter-io.cn`
  - `FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn`
- **结果**：环境变量配置成功。后续 `flutter` 命令输出提示 `Flutter assets will be downloaded from https://storage.flutter-io.cn.`
- **验证**：镜像生效，包下载不再走默认的 Google 源。

### 步骤4：运行环境体检

- **指令**：`flutter doctor`
- **结果**：全部 7 项为 ✓（全绿）
  ```
  [√] Flutter (Channel stable, 3.47.2, on Microsoft Windows [版本 10.0.26200.9445], locale zh-CN)
  [√] Windows Version (Windows 11 or higher, 25H2, 2009)
  [√] Android toolchain - develop for Android devices (Android SDK version 36.0.0)
  [√] Chrome - develop for the web
  [√] Visual Studio - develop Windows apps (Visual Studio 生成工具 2022 17.14.41)
  [√] Connected device (3 available)
  [√] Network resources
  • No issues found!
  ```
- **验证**：所有检查项全绿，环境就绪。

### 步骤5：接受 Android 许可协议

- **指令**：`flutter doctor --android-licenses`（全部输入 y）
- **结果**：所有许可协议已接受。
- **验证**：再次运行 `flutter doctor`，Android toolchain 项仍为 ✓，无许可警告。

## 三、总结

Flutter 开发环境在 TraeWork 辅助下搭建完成，`flutter doctor` 全绿，可进行 Web、Android、Windows 桌面三端开发与运行。
