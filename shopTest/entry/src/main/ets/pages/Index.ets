import { HomePage } from '../components/HomePage'
import { CategoryPage } from '../components/CategoryPage'
import { CartPage } from '../components/CartPage'
import { MinePage } from '../components/MinePage'
import { ProductDetailPage } from './ProductDetailPage'
import { SearchResultPage } from './SearchResultPage'
import { PaymentPage } from './PaymentPage'
import { LoginPage } from './LoginPage'
import { OrdersPage } from './OrdersPage'
import { FavoritesPage } from './FavoritesPage'
import { HistoryPage } from './HistoryPage'
import { initStore } from '../model/ShopStore'

@Entry
@Component
struct Index {
  @Provide('navStack') pathStack: NavPathStack = new NavPathStack()
  @StorageLink('currentTab') @Watch('onTabChanged') currentIndex: number = 0
  @StorageLink('cartCount') cartCount: number = 0
  tabController: TabsController = new TabsController()

  aboutToAppear(): void {
    initStore()
  }

  onTabChanged(): void {
    this.tabController.changeIndex(this.currentIndex)
  }

  @Builder
  tabBuilder(title: string, index: number) {
    Stack({ alignContent: Alignment.TopEnd }) {
      Text(title)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(this.currentIndex === index ? '#FF6B35' : '#8A8A8A')
        .padding({ top: 8 })
      if (index === 2 && this.cartCount > 0) {
        Text(this.cartCount > 99 ? '99+' : `${this.cartCount}`)
          .fontSize(9)
          .fontColor(Color.White)
          .backgroundColor('#FF3B30')
          .borderRadius(8)
          .padding({ left: 4, right: 4, top: 1, bottom: 1 })
          .constraintSize({ minWidth: 14 })
          .textAlign(TextAlign.Center)
          .offset({ x: -6, y: 4 })
      }
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  pageMap(name: string) {
    if (name === 'detail') {
      ProductDetailPage()
    } else if (name === 'search') {
      SearchResultPage()
    } else if (name === 'payment') {
      PaymentPage()
    } else if (name === 'login') {
      LoginPage()
    } else if (name === 'orders') {
      OrdersPage()
    } else if (name === 'favorites') {
      FavoritesPage()
    } else if (name === 'history') {
      HistoryPage()
    }
  }

  build() {
    Navigation(this.pathStack) {
      Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.tabBuilder('首页', 0))

        TabContent() {
          CategoryPage()
        }
        .tabBar(this.tabBuilder('商品', 1))

        TabContent() {
          CartPage()
        }
        .tabBar(this.tabBuilder('购物车', 2))

        TabContent() {
          MinePage()
        }
        .tabBar(this.tabBuilder('我的', 3))
      }
      .scrollable(false)
      .barHeight(56)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .navDestination(this.pageMap)
  }
}
