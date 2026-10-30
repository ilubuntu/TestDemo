export interface Product {
  id: number
  name: string
  desc: string
  price: number
  originalPrice: number
  sales: number
  category: string
  image: Resource
  hot: boolean
}

export interface CartItem {
  product: Product
  count: number
  selected: boolean
}

export interface OrderRecord {
  orderId: string
  items: CartItem[]
  total: number
  time: string
  status: string
}

export interface BannerItem {
  productId: number
  title: string
  image: Resource
}

export function createEmptyProduct(): Product {
  return {
    id: 0,
    name: '',
    desc: '',
    price: 0,
    originalPrice: 0,
    sales: 0,
    category: '',
    image: $r('app.media.product1'),
    hot: false
  }
}

export const CATEGORIES: string[] = ['推荐', '手机数码', '电脑办公', '家用电器', '服饰鞋包', '美妆个护', '食品生鲜']

export const HOT_KEYWORDS: string[] = ['手机', '耳机', '跑步鞋', '牛排', '精华液', '扫地机器人', '显示器', '坚果']

export const BANNERS: BannerItem[] = [
  {
    productId: 1,
    title: '旗舰智能手机 Pro 新品首发',
    image: $r('app.media.banner1')
  },
  {
    productId: 4,
    title: '轻薄笔记本 直降700元',
    image: $r('app.media.banner2')
  },
  {
    productId: 16,
    title: '每日坚果 第二件半价',
    image: $r('app.media.banner3')
  },
  {
    productId: 9,
    title: '扫地机器人 限时特惠',
    image: $r('app.media.banner4')
  }
]

export const PRODUCTS: Product[] = [
  {
    id: 1,
    name: '旗舰智能手机 Pro 5G 12GB+512GB',
    desc: '2K曲面屏 · 骁龙旗舰芯片 · 100W快充',
    price: 3999,
    originalPrice: 4599,
    sales: 12000,
    category: '手机数码',
    image: $r('app.media.product1'),
    hot: true
  },
  {
    id: 2,
    name: '真无线降噪耳机 主动降噪版',
    desc: '48dB深度降噪 · 40小时续航',
    price: 299,
    originalPrice: 499,
    sales: 35000,
    category: '手机数码',
    image: $r('app.media.product2'),
    hot: true
  },
  {
    id: 3,
    name: '智能运动手表 GT 陨石黑',
    desc: '血氧监测 · 14天续航 · 100+运动模式',
    price: 799,
    originalPrice: 999,
    sales: 8600,
    category: '手机数码',
    image: $r('app.media.product3'),
    hot: false
  },
  {
    id: 4,
    name: '轻薄笔记本电脑 14英寸 16G+1T',
    desc: '高色域屏 · 长续航 · 金属机身',
    price: 4299,
    originalPrice: 4999,
    sales: 5200,
    category: '电脑办公',
    image: $r('app.media.product4'),
    hot: true
  },
  {
    id: 5,
    name: '机械键盘 87键 RGB背光 青轴',
    desc: '全键无冲 · 热插拔轴座 · PBT键帽',
    price: 249,
    originalPrice: 329,
    sales: 15000,
    category: '电脑办公',
    image: $r('app.media.product5'),
    hot: false
  },
  {
    id: 6,
    name: '4K显示器 27英寸 IPS Type-C',
    desc: '4K超清 · 99% sRGB · 65W反向充电',
    price: 1499,
    originalPrice: 1799,
    sales: 4300,
    category: '电脑办公',
    image: $r('app.media.product6'),
    hot: false
  },
  {
    id: 7,
    name: '变频空调 大1.5匹 新一级能效',
    desc: '智能远程控制 · 静音节能 · 包安装',
    price: 2599,
    originalPrice: 2999,
    sales: 6800,
    category: '家用电器',
    image: $r('app.media.product7'),
    hot: true
  },
  {
    id: 8,
    name: '滚筒洗衣机 10公斤 变频节能',
    desc: '除菌洗 · 烘干一体 · 超薄嵌入',
    price: 1899,
    originalPrice: 2299,
    sales: 3900,
    category: '家用电器',
    image: $r('app.media.product8'),
    hot: false
  },
  {
    id: 9,
    name: '扫拖一体机器人 智能集尘 Pro',
    desc: '激光导航 · 自动集尘 · 热风烘干',
    price: 1699,
    originalPrice: 2199,
    sales: 9200,
    category: '家用电器',
    image: $r('app.media.product9'),
    hot: true
  },
  {
    id: 10,
    name: '轻便缓震跑步鞋 透气网面',
    desc: '回弹中底 · 透气轻盈 · 多色可选',
    price: 399,
    originalPrice: 599,
    sales: 21000,
    category: '服饰鞋包',
    image: $r('app.media.product10'),
    hot: true
  },
  {
    id: 11,
    name: '双面呢羊毛大衣 中长款',
    desc: '90%羊毛 · 双面手工 · 垂坠保暖',
    price: 899,
    originalPrice: 1580,
    sales: 5600,
    category: '服饰鞋包',
    image: $r('app.media.product11'),
    hot: false
  },
  {
    id: 12,
    name: '大容量旅行双肩背包 20L',
    desc: '防泼水面料 · 多仓收纳 · USB接口',
    price: 159,
    originalPrice: 239,
    sales: 18000,
    category: '服饰鞋包',
    image: $r('app.media.product12'),
    hot: false
  },
  {
    id: 13,
    name: '玻尿酸保湿精华液 30ml',
    desc: '深层补水 · 温和不刺激 · 敏感肌可用',
    price: 129,
    originalPrice: 199,
    sales: 30000,
    category: '美妆个护',
    image: $r('app.media.product13'),
    hot: true
  },
  {
    id: 14,
    name: '声波电动牙刷 智能压力感应',
    desc: '5档模式 · 30秒换区提醒 · 长续航',
    price: 199,
    originalPrice: 299,
    sales: 26000,
    category: '美妆个护',
    image: $r('app.media.product14'),
    hot: false
  },
  {
    id: 15,
    name: '原切谷饲牛排套餐 10片装',
    desc: '谷饲300天 · 原肉整切 · 顺丰冷链',
    price: 168,
    originalPrice: 238,
    sales: 12000,
    category: '食品生鲜',
    image: $r('app.media.product15'),
    hot: true
  },
  {
    id: 16,
    name: '每日坚果大礼包 30袋装',
    desc: '科学配比 · 新鲜锁鲜 · 孕妇儿童适用',
    price: 89,
    originalPrice: 139,
    sales: 50000,
    category: '食品生鲜',
    image: $r('app.media.product16'),
    hot: true
  }
]

export function getProductsByCategory(category: string): Product[] {
  if (category === '推荐') {
    return PRODUCTS.filter((item: Product) => item.hot)
  }
  return PRODUCTS.filter((item: Product) => item.category === category)
}

export function searchProducts(keyword: string): Product[] {
  const kw: string = keyword.trim()
  if (kw.length === 0) {
    return []
  }
  return PRODUCTS.filter((item: Product) => {
    return item.name.indexOf(kw) >= 0 || item.desc.indexOf(kw) >= 0 || item.category.indexOf(kw) >= 0
  })
}

export function getProductById(id: number): Product | undefined {
  return PRODUCTS.find((item: Product) => item.id === id)
}

export function toRows(list: Product[]): Product[][] {
  const rows: Product[][] = []
  for (let i = 0; i < list.length; i += 2) {
    const row: Product[] = []
    row.push(list[i])
    if (i + 1 < list.length) {
      row.push(list[i + 1])
    }
    rows.push(row)
  }
  return rows
}

export function formatSales(sales: number): string {
  if (sales >= 10000) {
    return `${(sales / 10000).toFixed(1)}万`
  }
  return `${sales}`
}

export function formatPrice(price: number): string {
  return `¥${price.toFixed(2)}`
}
