import { BannerItem, NewsItem, NEWS_LIST, BANNERS } from '../model/NewsData'
import { NewsItemCard } from './NewsItemCard'

const HOT_NEWS: NewsItem[] = NEWS_LIST.filter((item: NewsItem) => item.hot)

@Component
export struct HomePage {
  @Consume('navStack') pathStack: NavPathStack

  build() {
    Column() {
      Row() {
        Text('资讯头条')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Blank()
        Text('今天也要元气满满')
          .fontSize(12)
          .fontColor('#FFD3D3')
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#CF3C3C')
      .alignItems(VerticalAlign.Center)

      List({ space: 10 }) {
        ListItem() {
          Swiper() {
            ForEach(BANNERS, (banner: BannerItem) => {
              Stack({ alignContent: Alignment.BottomStart }) {
                Image(banner.image)
                  .width('100%')
                  .height(180)
                  .objectFit(ImageFit.Cover)
                Column() {
                  Text(banner.title)
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Color.White)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .width('100%')
                .padding({ left: 12, right: 12, top: 40, bottom: 12 })
                .linearGradient({
                  angle: 180,
                  colors: [['rgba(0,0,0,0)', 0.0], ['rgba(0,0,0,0.6)', 1.0]]
                })
              }
              .width('100%')
              .height(180)
              .borderRadius(12)
              .clip(true)
              .onClick(() => {
                this.pathStack.pushPathByName('detail', banner.newsId)
              })
            }, (banner: BannerItem) => banner.newsId.toString())
          }
          .autoPlay(true)
          .loop(true)
          .interval(3500)
          .duration(600)
          .width('100%')
          .height(180)
        }

        ListItem() {
          Row() {
            Text('热门新闻')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
            Blank()
            Text('更多 >')
              .fontSize(12)
              .fontColor('#999999')
          }
          .width('100%')
          .margin({ top: 12, bottom: 4 })
        }

        ForEach(HOT_NEWS, (item: NewsItem) => {
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
      .padding({ left: 12, right: 12, bottom: 12 })
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6F8')
  }
}
