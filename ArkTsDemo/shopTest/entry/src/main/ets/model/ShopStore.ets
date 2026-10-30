import { CartItem, OrderRecord, Product, PRODUCTS } from './ShopData'

const KEY_CART: string = 'cartItems'
const KEY_CART_COUNT: string = 'cartCount'
const KEY_FAVS: string = 'favIds'
const KEY_HISTORY: string = 'historyIds'
const KEY_LOGIN: string = 'isLogin'
const KEY_USERNAME: string = 'userName'
const KEY_ORDERS: string = 'orders'
const KEY_TAB: string = 'currentTab'

function countQuantity(list: CartItem[]): number {
  let n: number = 0
  list.forEach((item: CartItem) => {
    n += item.count
  })
  return n
}

function saveCart(list: CartItem[]): void {
  AppStorage.set<CartItem[]>(KEY_CART, list)
  AppStorage.set<number>(KEY_CART_COUNT, countQuantity(list))
}

export function initStore(): void {
  AppStorage.setOrCreate<CartItem[]>(KEY_CART, [])
  AppStorage.setOrCreate<number>(KEY_CART_COUNT, 0)
  AppStorage.setOrCreate<number[]>(KEY_FAVS, [])
  AppStorage.setOrCreate<number[]>(KEY_HISTORY, [])
  AppStorage.setOrCreate<boolean>(KEY_LOGIN, false)
  AppStorage.setOrCreate<string>(KEY_USERNAME, '')
  const seedItem1: CartItem = { product: PRODUCTS[4], count: 1, selected: true }
  const seedItem2: CartItem = { product: PRODUCTS[13], count: 2, selected: true }
  const seedOrders: OrderRecord[] = [
    {
      orderId: 'SO20261020001',
      items: [seedItem1],
      total: 249,
      time: '2026-10-20 14:32',
      status: '待收货'
    },
    {
      orderId: 'SO20261008002',
      items: [seedItem2],
      total: 398,
      time: '2026-10-08 09:15',
      status: '已完成'
    }
  ]
  AppStorage.setOrCreate<OrderRecord[]>(KEY_ORDERS, seedOrders)
  AppStorage.setOrCreate<number>(KEY_TAB, 0)
}

export function getCart(): CartItem[] {
  return AppStorage.get<CartItem[]>(KEY_CART) ?? []
}

export function addToCart(product: Product, count: number): void {
  const list: CartItem[] = getCart()
  const exist: CartItem | undefined = list.find((item: CartItem) => item.product.id === product.id)
  let next: CartItem[] = []
  if (exist !== undefined) {
    next = list.map((item: CartItem): CartItem => {
      if (item.product.id === product.id) {
        const updated: CartItem = { product: item.product, count: item.count + count, selected: item.selected }
        return updated
      }
      return item
    })
  } else {
    const added: CartItem = { product: product, count: count, selected: true }
    next = list.concat([added])
  }
  saveCart(next)
}

export function changeCount(productId: number, delta: number): void {
  const list: CartItem[] = getCart()
  const next: CartItem[] = []
  list.forEach((item: CartItem) => {
    const newCount: number = item.count + delta
    if (newCount <= 0) {
      return
    }
    const updated: CartItem = { product: item.product, count: newCount, selected: item.selected }
    next.push(updated)
  })
  saveCart(next)
}

export function removeItem(productId: number): void {
  const list: CartItem[] = getCart()
  saveCart(list.filter((item: CartItem) => item.product.id !== productId))
}

export function toggleSelected(productId: number): void {
  const list: CartItem[] = getCart()
  const next: CartItem[] = list.map((item: CartItem): CartItem => {
    if (item.product.id === productId) {
      const updated: CartItem = { product: item.product, count: item.count, selected: !item.selected }
      return updated
    }
    return item
  })
  saveCart(next)
}

export function setSelectAll(selected: boolean): void {
  const list: CartItem[] = getCart()
  const next: CartItem[] = list.map((item: CartItem): CartItem => {
    const updated: CartItem = { product: item.product, count: item.count, selected: selected }
    return updated
  })
  saveCart(next)
}

export function clearCartByIds(ids: number[]): void {
  const list: CartItem[] = getCart()
  saveCart(list.filter((item: CartItem) => ids.indexOf(item.product.id) < 0))
}

export function getFavIds(): number[] {
  return AppStorage.get<number[]>(KEY_FAVS) ?? []
}

export function toggleFavorite(productId: number): boolean {
  const list: number[] = getFavIds()
  const idx: number = list.indexOf(productId)
  let next: number[] = []
  let nowFav: boolean = false
  if (idx >= 0) {
    next = list.filter((id: number) => id !== productId)
    nowFav = false
  } else {
    next = [productId].concat(list)
    nowFav = true
  }
  AppStorage.set<number[]>(KEY_FAVS, next)
  return nowFav
}

export function addHistory(productId: number): void {
  let list: number[] = AppStorage.get<number[]>(KEY_HISTORY) ?? []
  list = list.filter((id: number) => id !== productId)
  list = [productId].concat(list)
  if (list.length > 20) {
    list = list.slice(0, 20)
  }
  AppStorage.set<number[]>(KEY_HISTORY, list)
}

export function clearHistory(): void {
  AppStorage.set<number[]>(KEY_HISTORY, [])
}

export function isLoggedIn(): boolean {
  return AppStorage.get<boolean>(KEY_LOGIN) ?? false
}

export function login(): void {
  AppStorage.set<boolean>(KEY_LOGIN, true)
  AppStorage.set<string>(KEY_USERNAME, '优选会员_8888')
}

export function logout(): void {
  AppStorage.set<boolean>(KEY_LOGIN, false)
  AppStorage.set<string>(KEY_USERNAME, '')
}

export function getUserName(): string {
  return AppStorage.get<string>(KEY_USERNAME) ?? ''
}

export function addOrder(items: CartItem[], total: number): OrderRecord {
  const orders: OrderRecord[] = AppStorage.get<OrderRecord[]>(KEY_ORDERS) ?? []
  const record: OrderRecord = {
    orderId: `SO${Date.now()}`,
    items: items,
    total: total,
    time: '刚刚',
    status: '待发货'
  }
  const next: OrderRecord[] = [record].concat(orders)
  AppStorage.set<OrderRecord[]>(KEY_ORDERS, next)
  return record
}

export function switchTab(index: number): void {
  AppStorage.set<number>(KEY_TAB, index)
}
