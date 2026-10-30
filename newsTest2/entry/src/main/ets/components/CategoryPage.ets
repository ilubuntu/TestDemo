import { NewsItem, CATEGORIES, getNewsByCategory } from '../model/NewsData'
import { NewsItemCard } from './NewsItemCard'

@Component
export struct CategoryPage {
  @Consume('navStack') pathStack: NavPathStack
  @State currentCategory: string = '推荐'

  @Builder
  quickChannelItem(label: string) {
    Column({ space: 4 }) {
      Text(label.substring(0, 1))
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
      Text(label)
        .fontSize(10)
        .fontColor(Color.White)
    }
    .width(48)
    .height(48)
    .borderRadius(10)
    .backgroundColor('#CF3C3C')
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentCategory = label
    })
  }

  build() {
    Column() {
      Row() {
        Row() {
          Image($r('app.media.icon_search'))
            .width(16)
            .height(16)
          Text('搜索你感兴趣的新闻')
            .fontSize(14)
            .fontColor('#999999')
            .margin({ left: 6 })
        }
        .layoutWeight(1)
        .height(36)
        .borderRadius(18)
        .backgroundColor(Color.White)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .onClick(() => {
          this.pathStack.pushPathByName('search', '')
        })
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 8, bottom: 8 })

      Row({ space: 8 }) {
        this.quickChannelItem('推荐')
        this.quickChannelItem('科技')
        this.quickChannelItem('财经')
        this.quickChannelItem('体育')
        this.quickChannelItem('娱乐')
        this.quickChannelItem('军事')
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 4, bottom: 8 })

      Scroll() {
        Row({ space: 10 }) {
          ForEach(CATEGORIES, (category: string) => {
            Text(category)
              .fontSize(14)
              .fontColor(this.currentCategory === category ? Color.White : '#555555')
              .backgroundColor(this.currentCategory === category ? '#CF3C3C' : Color.White)
              .borderRadius(14)
              .padding({ left: 14, right: 14, top: 6, bottom: 6 })
              .onClick(() => {
                this.currentCategory = category
              })
          }, (category: string) => category)
        }
        .padding({ left: 12, right: 12 })
      }
      .scrollable(ScrollDirection.Horizontal)
      .scrollBar(BarState.Off)
      .width('100%')
      .margin({ top: 2, bottom: 8 })

      List({ space: 10 }) {
        ForEach(getNewsByCategory(this.currentCategory), (item: NewsItem) => {
          ListItem() {
            NewsItemCard({
              news: item,
              onItemClick: (news: NewsItem) => {
                this.pathStack.pushPathByName('detail', news.id)
              }
            })
          }
        }, (item: NewsItem) => `${this.currentCategory}-${item.id}`)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 12, right: 12, bottom: 12 })
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6F8')
  }
}
