# shopTest（优选商城）

基于 HarmonyOS ArkTS 开发的电商购物类应用 Demo，覆盖商品浏览、搜索、购物车、下单支付、登录、订单、收藏与浏览历史等常见购物场景，可作为商城类应用的基础模板。

## 功能介绍

应用采用底部 Tabs + Navigation 的导航结构，主要分为四大主模块：

1. 首页：商品推荐流展示，支持搜索入口，点击商品进入详情
2. 分类：按分类筛选商品
3. 购物车：管理购物车商品，Tab 上显示购物车数量角标（超过 99 显示 99+）
4. 我的：个人中心，提供登录、订单、收藏、浏览历史等入口

主要页面：

- `pages/Index.ets`：主页面，承载底部 Tab 与路由，初始化全局状态
- `components/HomePage.ets`：首页商品列表
- `components/CategoryPage.ets`：分类页
- `components/CartPage.ets`：购物车页
- `components/MinePage.ets`：我的页
- `components/ProductCard.ets`：商品卡片组件
- `pages/ProductDetailPage.ets`：商品详情页
- `pages/SearchResultPage.ets`：搜索结果页
- `pages/PaymentPage.ets`：收银台/支付页
- `pages/LoginPage.ets`：登录页
- `pages/OrdersPage.ets`：订单列表页
- `pages/FavoritesPage.ets`：收藏页
- `pages/HistoryPage.ets`：浏览历史页
- `model/ShopData.ets`：商品模拟数据
- `model/ShopStore.ets`：全局状态（购物车数量、当前 Tab 等），基于 AppStorage 实现

## 目录结构

```
shopTest
├── AppScope                 # 应用级配置与资源
├── entry
│   └── src/main
│       ├── ets
│       │   ├── components   # 页面级组件
│       │   ├── entryability # Ability 入口
│       │   ├── model        # 数据模型与全局状态
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

- 仅使用本地模拟数据，未接入真实网络请求与真实支付。
- 仅在手机形态下验证，其他设备形态未做适配。
