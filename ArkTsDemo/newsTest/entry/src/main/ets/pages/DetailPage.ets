import { NewsItem, NEWS_LIST, createEmptyNews } from '../model/NewsData'

@Component
export struct DetailPage {
  @Consume('navStack') pathStack: NavPathStack
  @State news: NewsItem = createEmptyNews()
  @State found: boolean = true

  aboutToAppear(): void {
    const params: Array<ESObject> = this.pathStack.getParamByName('detail')
    if (params.length > 0 && params[0] !== undefined) {
      const id: number = params[0] as number
      const target: NewsItem | undefined = NEWS_LIST.find((item: NewsItem) => item.id === id)
      if (target !== undefined) {
        this.news = target
      } else {
        this.found = false
      }
    }
  }

  build() {
    NavDestination() {
      if (this.found) {
        Scroll() {
          Column() {
            Text(this.news.title)
              .fontSize(22)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
              .lineHeight(32)
              .width('100%')

            Row({ space: 8 }) {
              Text(this.news.category)
                .fontSize(11)
                .fontColor('#CF3C3C')
                .backgroundColor('#FDEAEA')
                .borderRadius(4)
                .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              Text(this.news.source)
                .fontSize(12)
                .fontColor('#999999')
              Text(this.news.publishTime)
                .fontSize(12)
                .fontColor('#999999')
            }
            .width('100%')
            .margin({ top: 12, bottom: 16 })

            Image(this.news.image)
              .width('100%')
              .height(200)
              .borderRadius(12)
              .objectFit(ImageFit.Cover)

            // ForEach(this.news.content.split('\n'), (para: string, index: number) => {
            //   Text(para)
            //     .fontSize(16)
            //     .lineHeight(28)
            //     .fontColor('#333333')
            //     .width('100%')
            //     .margin({ top: 16 })
            //     .textAlign(TextAlign.JUSTIFY)
            // }, (para: string, index: number) => `${index}-${para.length}`)
          }
          .alignItems(HorizontalAlign.Start)
          .padding(16)
          .constraintSize({ maxWidth: 600 })
          .width('100%')
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      } else {
        Column() {
          Text('内容不存在或已下架')
            .fontSize(15)
            .fontColor('#999999')
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
    }
    .title('新闻详情')
    .backgroundColor('#F5F6F8')
  }
}
