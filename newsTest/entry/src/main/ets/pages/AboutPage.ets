@Component
export struct AboutPage {
  @Consume('navStack') pathStack: NavPathStack

  build() {
    NavDestination() {
      Column() {
        Column() {
          Text('N')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .width(88)
        .height(88)
        .borderRadius(24)
        .backgroundColor('#CF3C3C')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .margin({ top: 60 })

        Text('资讯头条')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor('#222222')
          .margin({ top: 16 })

        Text('v1.0.0')
          .fontSize(13)
          .fontColor('#999999')
          .margin({ top: 6 })

        Text('资讯头条是一款简洁高效的新闻阅读应用，覆盖科技、财经、体育、娱乐、军事等领域，为你提供快速、真实、有价值的资讯内容。')
          .fontSize(14)
          .fontColor('#666666')
          .lineHeight(24)
          .padding({ left: 32, right: 32 })
          .margin({ top: 28 })
          .textAlign(TextAlign.Center)

        Text('让阅读更轻松，让资讯更有温度')
          .fontSize(13)
          .fontColor('#CF3C3C')
          .margin({ top: 10 })
      }
      .constraintSize({ maxWidth: 600 })
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .title('关于我们')
    .backgroundColor(Color.White)
  }
}
