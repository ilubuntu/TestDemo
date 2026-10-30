import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { Theme } from '../common/Theme';
import { initShelf } from '../model/BookData';
import { BookStoreComp } from '../components/BookStoreComp';
import { BookShelfComp } from '../components/BookShelfComp';
import { SettingsComp } from '../components/SettingsComp';
import { BookContentPage } from './BookContentPage';

const TAB_TITLES: string[] = ['书城', '设置', '书架'];

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  @StorageProp('topInset') topInset: number = 0;
  @StorageProp('bottomInset') bottomInset: number = 0;
  private pathStack: NavPathStack = new NavPathStack();
  private tabsController: TabsController = new TabsController();

  aboutToAppear(): void {
    initShelf();
    this.queryAvoidArea();
  }

  /** 沉浸式：查询状态栏与底部导航条高度，供页面做避让内边距 */
  queryAvoidArea(): void {
    const ctx = this.getUIContext().getHostContext();
    if (ctx === undefined) {
      return;
    }
    window.getLastWindow(ctx).then((win: window.Window) => {
      const topPx = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect.height;
      const bottomPx =
        win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect.height;
      const ui = this.getUIContext();
      AppStorage.setOrCreate<number>('topInset', ui.px2vp(topPx));
      AppStorage.setOrCreate<number>('bottomInset', ui.px2vp(bottomPx));
    }).catch((err: BusinessError) => {
      hilog.error(0x0000, 'readTest', 'query avoid area failed: %{public}s', JSON.stringify(err));
    });
  }

  /** 打开书籍内容页（Navigation 跳转） */
  openBook(id: number): void {
    this.pathStack.pushPathByName('BookContent', id);
  }

  /** 书架页“添加书籍”：切换到书城 tab */
  goStore(): void {
    this.currentIndex = 0;
    this.tabsController.changeIndex(0);
  }

  @Builder
  pageMap(name: string) {
    if (name === 'BookContent') {
      BookContentPage()
    }
  }

  @Builder
  tabItem(title: string, index: number) {
    Column({ space: 4 }) {
      Text(title)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(this.currentIndex === index ? Theme.TAB_ACTIVE : Theme.TAB_INACTIVE)
      Column()
        .width(18)
        .height(3)
        .borderRadius(2)
        .backgroundColor(this.currentIndex === index ? Theme.TAB_ACTIVE : Color.Transparent)
    }
    .layoutWeight(1)
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(index);
    })
  }

  @Builder
  bottomBar() {
    Row() {
      this.tabItem(TAB_TITLES[0], 0)
      this.tabItem(TAB_TITLES[1], 1)
      this.tabItem(TAB_TITLES[2], 2)
    }
    .width('100%')
    .height(56)
    .backgroundColor(Theme.BG_CARD)
    .padding({ bottom: this.bottomInset })
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
  }

  build() {
    Navigation(this.pathStack) {
      Column() {
        Tabs({ index: this.currentIndex, controller: this.tabsController }) {
          TabContent() {
            BookStoreComp({ onOpenBook: (id: number) => this.openBook(id) })
          }.tabBar('')

          TabContent() {
            SettingsComp()
          }.tabBar('')

          TabContent() {
            BookShelfComp({
              onOpenBook: (id: number) => this.openBook(id),
              onAddBook: () => this.goStore()
            })
          }.tabBar('')
        }
        .scrollable(false)
        .barHeight(0)
        .width('100%')
        .layoutWeight(1)
        .onChange((index: number) => {
          this.currentIndex = index;
        })

        this.bottomBar()
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Theme.BG_PAGE)
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .hideToolBar(true)
    .navDestination(this.pageMap)
  }
}
