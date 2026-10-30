import { NewsItem, createEmptyNews } from '../model/NewsData'

@Component
export struct NewsItemCard {
  @Prop news: NewsItem = createEmptyNews()
  onItemClick: (news: NewsItem) => void = () => {
  }

  build() {
    Row() {
      Image(this.news.image)
        .width(96)
        .height(66)
        .borderRadius(8)
        .objectFit(ImageFit.Cover)

      Column({ space: 6 }) {
        Text(this.news.title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#222222')
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
        Blank()
        Row() {
          Text(this.news.category)
            .fontSize(10)
            .fontColor('#CF3C3C')
            .backgroundColor('#FDEAEA')
            .borderRadius(4)
            .width(72)
            .textAlign(TextAlign.Center)
            .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          Text(`${this.news.source}  ${this.news.publishTime}`)
            .fontSize(11)
            .fontColor('#999999')
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      }
      .width(230)
      .height(66)
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 10 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .onClick(() => {
      this.onItemClick(this.news)
    })
  }
}
