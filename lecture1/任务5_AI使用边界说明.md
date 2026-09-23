# 自主实践任务5：AI使用边界说明

## 一、本作业中 AI 做了什么

| 环节 | AI 是否参与 | 具体做了什么 |
|------|------------|--------------|
| 阅读 `mapp-guide-1.docx` 与 `mapp-homework-1.doc` | 是 | 用脚本把二进制 Word 文档提取为文本，便于阅读指南与作业要求 |
| 创建 hello_world 项目 | 否 | 由 `flutter create hello_world` 命令生成，AI 未改一个字符 |
| 为 main.dart 加逐行中文注释 | 是 | AI 在原代码基础上添加注释，未修改任何逻辑代码；并修正了原文件中两处类名缺失（`ColorScheme.fromSeed`、`MainAxisAlignment.center`） |
| 初始化 Git 仓库与提交 | 否 | `git init`、`git add`、`git commit` 均由本人核对后执行 |
| Web 端运行截图 | 部分 | AI 用浏览器自动化打开本地 web 服务并截图；截图由本人确认内容正确后保留 |
| 模拟器运行截图 | 否 | `flutter run -d emulator-5554` 与 `adb screencap` 由本人执行 |
| Gradle SSL 证书问题定位 | 是 | AI 根据报错栈定位到 Gradle wrapper 下载 URL 与 Java truststore，给出镜像替换方案 |
| 项目路径中文报错定位 | 是 | AI 根据报错指出 AGP 对非 ASCII 路径的检查，给出 `android.overridePathCheck=true` 方案 |
| 编写 README 与各说明文档 | 是 | AI 起草文档，本人核对内容与截图一致后保留 |
| 编写进度报告 | 是 | AI 按模板十节起草，本人核对后保留 |

## 二、什么必须自己做

按实践指南第四章 4.3 节"什么时候必须人工介入"的清单：

1. **系统级配置修改**：环境变量（`PUB_HOSTED_URL`、`FLUTTER_STORAGE_BASE_URL`、PATH）的修改、保存与应用，必须由本人执行。AI 只能给出"改哪个变量、改成什么值"的方案。
2. **文件删除**：本次未涉及删除操作；若涉及，必须本人确认后再删。
3. **账号密码输入**：Gitee/GitHub 登录、仓库创建、push 时的鉴权信息，一律本人输入，不交给 AI。
4. **flutter doctor 的判断**：AI 可以读输出，但"哪项是绿、哪项是黄、到底算不算就绪"以本人核对的截图为准。
5. **Git 提交**：提交必须在本人账号下完成；commit message 由本人确认后再提交。
6. **代码理解与答辩**：指南明确要求"AI 生成的每一行代码你都能解释其作用，检查点环节教师会抽查口头解释"。main.dart 中 `runApp`、`Widget`、`setState` 等概念，必须本人理解。

## 三、红线（学术诚信）

依据指南 4.3 节与作业单页第六节：

- **标注**：本进度报告第七节已逐项写明哪部分由 AI 辅助、用了什么提示。
- **验证**：AI 写的每一行代码本人在运行中验证过；`flutter run` 在 Web 与模拟器两端都跑通，截图为本机实测。
- **负责**：AI 写错了，责任在提交里。本次出现一处典型情况——AI 最初生成 main.dart 注释时，原模板文件存在两处类名缺失（`ColorScheme.fromSeed` 与 `MainAxisAlignment.center`），AI 起草注释时一并修正，否则代码无法编译。

伪造运行证据（截图造假、借他人设备冒充）与直接提交未经验证的 AI 生成代码，均按未完成处理。
