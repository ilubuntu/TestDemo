import { HomePage } from '../components/HomePage'
import { CategoryPage } from '../components/CategoryPage'
import { SettingsPage } from '../components/SettingsPage'
import { DetailPage } from './DetailPage'
import { SearchPage } from './SearchPage'
import { PrivacyPage } from './PrivacyPage'
import { AboutPage } from './AboutPage'

@Entry
@Component
struct Index {
  @Provide('navStack') pathStack: NavPathStack = new NavPathStack()
  @State currentIndex: number = 0

  @Builder
  tabBuilder(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(this.currentIndex === index ? '#CF3C3C' : '#8A8A8A')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  pageMap(name: string) {
    if (name === 'detail') {
      DetailPage()
    } else if (name === 'search') {
      SearchPage()
    } else if (name === 'privacy') {
      PrivacyPage()
    } else if (name === 'about') {
      AboutPage()
    }
  }

  build() {
    Navigation(this.pathStack) {
      Tabs({
        barPosition: BarPosition.End,
        index: this.currentIndex
      }) {
        TabContent() {
          HomePage()
        }
        .tabBar(this.tabBuilder('首页', 0))

        TabContent() {
          CategoryPage()
        }
        .tabBar(this.tabBuilder('分类', 1))

        TabContent() {
          SettingsPage()
        }
        .tabBar(this.tabBuilder('设置', 2))
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
