# newsTest（资讯头条）

基于 HarmonyOS ArkTS 开发的资讯类应用 Demo，展示新闻列表浏览、分类切换、搜索详情等常见资讯场景的实现。

## 功能介绍

应用采用底部 Tabs + Navigation（Stack 模式）的典型导航结构，主要分为首页、分类、设置三大模块：

1. 首页：新闻推荐流展示，点击卡片进入新闻详情
2. 分类：按分类（推荐、科技、财经、体育等）筛选新闻列表，支持快捷分类入口
3. 设置：应用设置入口，包含隐私政策、关于页面等

主要页面：

- `pages/Index.ets`：主页面，承载底部 Tab 与路由
- `components/HomePage.ets`：首页新闻列表
- `components/CategoryPage.ets`：分类页
- `components/SettingsPage.ets`：设置页
- `components/NewsItemCard.ets`：新闻卡片组件
- `pages/DetailPage.ets`：新闻详情页
- `pages/SearchPage.ets`：搜索页
- `pages/AboutPage.ets`：关于页
- `pages/PrivacyPage.ets`：隐私政策页
- `model/NewsData.ets`：新闻模拟数据与分类数据源

## 目录结构

```
newsTest
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
