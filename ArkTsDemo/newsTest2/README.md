# newsTest2（资讯头条2）

基于 HarmonyOS ArkTS 开发的资讯类应用 Demo，是 [newsTest](../newsTest) 的迭代版本，整体导航结构一致，主要优化了分类页与新闻卡片、详情页、搜索页的展示细节。

## 功能介绍

应用采用底部 Tabs + Navigation（Stack 模式）的典型导航结构，主要分为首页、分类、设置三大模块：

1. 首页：新闻推荐流展示，点击卡片进入新闻详情
2. 分类：按分类筛选新闻，新增彩色快捷分类入口，可一键切换分类
3. 设置：应用设置入口，包含隐私政策、关于页面等

与 newsTest 的主要差异：

- 分类页新增快捷频道入口（彩色圆角方块），分类切换更直观
- 新闻卡片、详情页、搜索页样式微调

主要页面：

- `pages/Index.ets`：主页面，承载底部 Tab 与路由
- `components/HomePage.ets`：首页新闻列表
- `components/CategoryPage.ets`：分类页（含快捷频道入口）
- `components/SettingsPage.ets`：设置页
- `components/NewsItemCard.ets`：新闻卡片组件
- `pages/DetailPage.ets`：新闻详情页
- `pages/SearchPage.ets`：搜索页
- `pages/AboutPage.ets`：关于页
- `pages/PrivacyPage.ets`：隐私政策页
- `model/NewsData.ets`：新闻模拟数据与分类数据源

## 目录结构

```
newsTest2
├── AppScope                 # 应用级配置与资源
├── entry
│   └── src/main
│       ├── ets
│       │   ├── components   # 页面级组件
│       │   ├── entryability # Ability 入口
│       │   ├── model        # 数据模型
│       │   └── pages        # 页面
│       └── resources        # 资源文件
├── build-profile.json5      # 构建配置
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
