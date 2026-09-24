# 课堂作业一 进度报告（提交版）

> 课程：移动应用软件开发实训 第1课《移动应用开发概述与AI增强开发环境》
> 姓名：成思辰　班级：Flutter 线
> 仓库地址：https://github.com/cl0vers33/hello_world （master 分支，本文件位于 lecture1/progress.md，详细十节报告见 lecture1/进度报告一.md 与 进度报告一.docx）

## 一、检查点完成情况

| 检查点 | 结果 | 证据 |
|--------|------|------|
| flutter doctor 全绿 | ✓ 7 项全绿，No issues found! | docs/flutter_doctor.png（终端整屏截图）、docs/flutter_doctor_output.txt |
| HelloWorld 在 Web 端运行 | ✓ Chrome 中计数器示例正常显示 | docs/web_run.png（Chrome 全屏整屏截图） |
| HelloWorld 在 Android 模拟器运行 | ✓ 模拟器中界面一致，应用正常启动 | docs/emulator_run.png（桌面整屏截图含模拟器窗口） |
| 仓库首次提交与多次提交 | ✓ 5 次中文语义化提交（原 6 条小步提交已合并精简），无 build/ 垃圾文件 | GitHub 仓库 Commits 页，docs/github_repo.png（全屏整屏截图） |

注：以上证据图均已在电脑上打开对应页面/窗口后截取整屏画面（2026-09-24 重新截取）。

补充：复检 doctor 时 Visual Studio 项曾报 [!]（缺 Windows 10 SDK），补装后转绿，真实全绿。

## 二、遇到的问题与解决方式

**问题1：Gradle 下载 SSL 证书验证失败**
- 现象：`flutter run -d emulator-5554` 报 `javax.net.ssl.SSLHandshakeException: PKIX path building failed`。
- 定位：Gradle wrapper 从 services.gradle.org 下载发行版，Java truststore 不识别其证书链。
- 解决：`gradle-wrapper.properties` 的 distributionUrl 改为腾讯云镜像，`settings.gradle.kts` 前置阿里云 Maven 镜像。再次运行构建通过。

**问题2：项目路径含中文被 Android Gradle Plugin 拒绝**
- 现象：构建报 `Your project path contains non-ASCII characters`。
- 定位：项目路径含"作业""移动应用开发实践"等中文目录。
- 解决：按报错官方提示在 `android/gradle.properties` 追加 `android.overridePathCheck=true`，构建通过。

**问题3：flutter doctor 的 Visual Studio 项报 [!] 缺 Windows 10 SDK**
- 现象：`Unable to locate a Windows 10 SDK`，Windows Kits 目录不存在。
- 定位：BuildTools 2022 当初未勾选任何 Windows SDK 版本。
- 解决：经本人 UAC 确认后由 VS Installer 加装 Windows 10 SDK 19041，doctor 恢复全绿。

## 三、自主实践完成度自查

| 序 | 任务 | 完成 |
|----|------|------|
| 1 | TraeWork 辅助安装过程记录（指令/结果/验证三要素） | ✓ lecture1/任务1 |
| 2 | flutter doctor 问题定位与修复记录（3 个真实问题） | ✓ lecture1/任务2 |
| 3 | 手工安装原理说明（SDK、工具链、PATH 三层关系） | ✓ lecture1/任务3 |
| 4 | HelloWorld 代码逐行中文注释（main.dart 全文） | ✓ lecture1/任务4、lib/main.dart |
| 5 | AI 使用边界说明（何时人工介入） | ✓ lecture1/任务5 |

## 四、独立研究任务（选做）

本次未完成，计划课后补做任务1（flutter config 与国内镜像机制实验：配置前后各下载一个包对比耗时），已列入进度报告第十节"下一步计划"。

## 五、AI 使用记录摘要（指令原文 + 验证过程）

| 指令原文 | AI 输出 | 验证方式 |
|---------|---------|----------|
| "帮我完成作业所有任务，并提交github" | 拆解任务、读取两份 Word 作业文档、规划执行 | 人工对照原文确认要求无遗漏 |
| "为 main.dart 添加逐行中文注释" | 注释版 main.dart（未改逻辑，补全模板缺失的 ColorScheme.fromSeed 与 MainAxisAlignment.center 两处类名） | flutter build web / apk 均编译通过，两端运行正常 |
| 贴 Gradle SSL 报错栈，问"怎么修" | 切换腾讯云 Gradle 镜像 + 阿里云 Maven 镜像 | 再次 flutter run 构建成功 |
| 贴路径中文报错，问"怎么修" | 加 android.overridePathCheck=true | 再次 flutter run 成功安装启动 |
| 贴 doctor 的 [!] 输出问原因 | 给出 VS Installer 组件 ID 与命令 | 本人 UAC 确认执行安装，doctor 转绿 |
| "创建仓库并推送" | remote/push 命令 | 本人网页建仓，push 成功、页面可访问 |
| "把 commit 中的标注改成中文" | 重写 7 条历史 + force-with-lease 推送 | 本人确认后执行，远端 Commits 显示中文 |

红线遵守：系统级修改（环境变量、VS 组件安装）、GitHub 登录与建仓、UAC 确认均由本人完成；AI 生成的每行代码与文档均经本人核对、可解释。

## 六、本课一句话收获

环境搭建的本质是"SDK + 平台工具链 + PATH"三层协作——flutter doctor 是体检单而不是药方，学会读报错、用镜像、改配置，比一次装成功更重要。
