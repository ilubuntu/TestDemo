import { BannerItem, Product, BANNERS, PRODUCTS, toRows } from '../model/ShopData'
import { switchTab } from '../model/ShopStore'
import { ProductCard } from './ProductCard'

const HOT_PRODUCTS: Product[] = PRODUCTS.filter((item: Product) => item.hot)

@Component
export struct HomePage {
  @Consume('navStack') pathStack: NavPathStack

  @Builder
  kingKongItem(bgColor: string, label: string, sub: string, tabIndex: number) {
    Column({ space: 6 }) {
      Column() {
        Text(sub)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .width(46)
      .height(46)
      .borderRadius(23)
      .backgroundColor(bgColor)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      Text(label)
        .fontSize(12)
        .fontColor('#555555')
    }
    .layoutWeight(1)
    .onClick(() => {
      switchTab(tabIndex)
    })
  }

  build() {
    Column() {
      Column() {
        Row() {
          Text('优选商城')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Blank()
          Text('好物优选 · 品质保障')
            .fontSize(11)
            .fontColor('#FFE3D1')
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)

        Row() {
          Image($r('app.media.icon_search'))
            .width(16)
            .height(16)
          Text('搜索商品，发现好物')
            .fontSize(13)
            .fontColor('#999999')
            .margin({ left: 6 })
        }
        .width('100%')
        .height(36)
        .borderRadius(18)
        .backgroundColor(Color.White)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
        .margin({ top: 10 })
        .onClick(() => {
          this.pathStack.pushPathByName('search', '')
        })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 10, bottom: 12 })
      .backgroundColor('#FF6B35')

      List({ space: 10 }) {
        ListItem() {
          Swiper() {
            ForEach(BANNERS, (banner: BannerItem) => {
              Stack({ alignContent: Alignment.BottomStart }) {
                Image(banner.image)
                  .width('100%')
                  .height(150)
                  .objectFit(ImageFit.Cover)
                Column() {
                  Text(banner.title)
                    .fontSize(15)
                    .fontWeight(FontWeight.Bold)
                    .fontColor(Color.White)
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                }
                .width('100%')
                .padding({ left: 12, right: 12, top: 36, bottom: 10 })
                .linearGradient({
                  angle: 180,
                  colors: [['rgba(0,0,0,0)', 0.0], ['rgba(0,0,0,0.6)', 1.0]]
                })
              }
              .width('100%')
              .height(150)
              .borderRadius(12)
              .clip(true)
              .onClick(() => {
                this.pathStack.pushPathByName('detail', banner.productId)
              })
            }, (banner: BannerItem) => banner.productId.toString())
          }
          .autoPlay(true)
          .loop(true)
          .interval(3500)
          .duration(600)
          .indicator(true)
          .width('100%')
          .height(150)
        }

        ListItem() {
          Row() {
            this.kingKongItem('#FF6B35', '新品首发', '新', 1)
            this.kingKongItem('#5F9BFF', '限时秒杀', '秒', 1)
            this.kingKongItem('#00B894', '品牌好店', '牌', 1)
            this.kingKongItem('#FDCB6E', '领券中心', '券', 0)
          }
          .width('100%')
          .padding({ top: 6, bottom: 6 })
          .backgroundColor(Color.White)
          .borderRadius(12)
        }

        ListItem() {
          Row() {
            Text('为你推荐')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
            Blank()
            Text('更多好物 >')
              .fontSize(12)
              .fontColor('#999999')
          }
          .width('100%')
          .margin({ top: 2 })
          .onClick(() => {
            switchTab(1)
          })
        }

        ForEach(toRows(HOT_PRODUCTS), (row: Product[]) => {
          ListItem() {
            Row({ space: 10 }) {
              ProductCard({
                product: row[0],
                onCardClick: (product: Product) => {
                  this.pathStack.pushPathByName('detail', product.id)
                }
              })
              if (row.length > 1) {
                ProductCard({
                  product: row[1],
                  onCardClick: (product: Product) => {
                    this.pathStack.pushPathByName('detail', product.id)
                  }
                })
              } else {
                Column()
                  .layoutWeight(1)
              }
            }
            .width('100%')
          }
        }, (row: Product[]) => row[0].id.toString())
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 12, right: 12, top: 10, bottom: 12 })
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6F8')
  }
}
