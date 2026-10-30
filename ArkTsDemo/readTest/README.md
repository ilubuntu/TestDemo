# readTest（阅读 Demo）

基于 HarmonyOS ArkTS 开发的阅读类应用 Demo，包含书城、书架、设置三个模块，支持沉浸式展示与阅读页跳转，可作为阅读类应用的基础模板。

## 功能介绍

应用采用底部 Tabs + Navigation 的导航结构：

1. 书城：书籍列表浏览，可将书籍加入书架
2. 书架：展示已收藏的书籍，点击进入阅读页，支持"去书城添加"引导
3. 设置：阅读相关设置

主要特性：

- 沉浸式显示：自动查询状态栏与底部导航条避让区域高度，通过 `AppStorage`（`topInset`/`bottomInset`）下发各页面做避让内边距
- 书架数据初始化：进入应用时通过 `initShelf()` 恢复本地书架数据

主要页面：

- `pages/Index.ets`：主页面，承载底部 Tab 与路由，处理避让区查询
- `components/BookStoreComp.ets`：书城组件
- `components/BookShelfComp.ets`：书架组件
- `components/SettingsComp.ets`：设置组件
- `pages/BookContentPage.ets`：书籍阅读页
- `model/BookData.ets`：书籍数据与书架持久化逻辑
- `common/Theme.ets`：主题色等公共样式常量

## 目录结构

```
readTest
├── AppScope                 # 应用级配置与资源
├── entry
│   └── src/main
│       ├── ets
│       │   ├── common       # 主题与公共常量
│       │   ├── components   # 页面级组件
│       │   ├── entryability # Ability 入口
│       │   ├── entrybackupability # 备份 Ability
│       │   ├── model        # 数据模型
│       │   └── pages        # 页面
│       └── resources        # 资源文件
├── build-profile.json5      # 构建配置
├── code-linter.json5        # 代码检查配置
├── hvigorfile.ts            # 构建脚本
└── oh-package.json5         # 依赖配置
```

## 快速入门

1. 使用 DevEco Studio 打开本工程目录。
2. 等待 Sync 完成后，连接 HarmonyOS 设备或启动模拟器。
3. 点击 Run 运行 entry 模块。

## 约束和限制

- 仅使用本地模拟数据，未接入真实网络请求。
- 仅在手机形态下验证，其他设备形态未做适配。
