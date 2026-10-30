import { NewsItem, HOT_SEARCH_WORDS, searchNews } from '../model/NewsData'
import { NewsItemCard } from '../components/NewsItemCard'

@Component
export struct SearchPage {
  @Consume('navStack') pathStack: NavPathStack
  @State keyword: string = ''
  @State searched: boolean = false
  @State results: NewsItem[] = []

  doSearch(word: string): void {
    const kw: string = word.trim()
    if (kw.length === 0) {
      return
    }
    this.keyword = kw
    this.results = searchNews(kw)
    this.searched = true
  }

  build() {
    NavDestination() {
      Column() {
        Row({ space: 10 }) {
          Row() {
            Image($r('app.media.icon_search'))
              .width(16)
              .height(16)
            TextInput({ placeholder: '请输入关键词' })
              .layoutWeight(1)
              .height(40)
              .backgroundColor(Color.Transparent)
              .padding({ left: 8, right: 8 })
              .fontSize(14)
              .defaultFocus(true)
              .onChange((value: string) => {
                this.keyword = value
              })
              .onSubmit(() => {
                this.doSearch(this.keyword)
              })
          }
          .layoutWeight(1)
          .height(40)
          .borderRadius(20)
          .backgroundColor('#F1F2F3')
          .alignItems(VerticalAlign.Center)
          .padding({ left: 14, right: 6 })

          Text('搜索')
            .fontSize(15)
            .fontColor('#CF3C3C')
            .fontWeight(FontWeight.Medium)
            .onClick(() => {
              this.doSearch(this.keyword)
            })
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .alignItems(VerticalAlign.Center)

        if (!this.searched) {
          Column() {
            Text('热门搜索')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
              .width('100%')
            Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
              ForEach(HOT_SEARCH_WORDS, (word: string) => {
                Text(word)
                  .fontSize(13)
                  .fontColor('#555555')
                  .backgroundColor('#F1F2F3')
                  .borderRadius(14)
                  .padding({ left: 14, right: 14, top: 7, bottom: 7 })
                  .margin({ right: 8, bottom: 10 })
                  .onClick(() => {
                    this.doSearch(word)
                  })
              }, (word: string) => word)
            }
            .width(360)
            .margin({ top: 14 })
          }
          .width(380)
          .alignItems(HorizontalAlign.Start)
          .padding(16)
        } else {
          if (this.results.length === 0) {
            Column() {
              Text(`未找到与「${this.keyword}」相关的新闻`)
                .fontSize(14)
                .fontColor('#999999')
            }
            .width('100%')
            .layoutWeight(1)
            .justifyContent(FlexAlign.Center)
          } else {
            List({ space: 10 }) {
              ListItem() {
                Text(`共找到 ${this.results.length} 条相关结果`)
                  .fontSize(13)
                  .fontColor('#999999')
                  .width('100%')
              }
              ForEach(this.results, (item: NewsItem) => {
                ListItem() {
                  NewsItemCard({
                    news: item,
                    onItemClick: (news: NewsItem) => {
                      this.pathStack.pushPathByName('detail', news.id)
                    }
                  })
                }
              }, (item: NewsItem) => item.id.toString())
            }
            .width('100%')
            .layoutWeight(1)
            .padding({ left: 12, right: 12, top: 4, bottom: 12 })
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
          }
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F6F8')
    }
    .title('搜索')
    .backgroundColor('#F5F6F8')
  }
}
