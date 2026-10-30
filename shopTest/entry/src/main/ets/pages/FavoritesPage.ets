import { Product, PRODUCTS } from '../model/ShopData'
import { toggleFavorite } from '../model/ShopStore'
import { promptAction } from '@kit.ArkUI'

@Component
export struct FavoritesPage {
  @Consume('navStack') pathStack: NavPathStack
  @StorageLink('favIds') favIds: number[] = []

  getFavProducts(): Product[] {
    const list: Product[] = []
    this.favIds.forEach((id: number) => {
      const target: Product | undefined = PRODUCTS.find((item: Product) => item.id === id)
      if (target !== undefined) {
        list.push(target)
      }
    })
    return list
  }

  build() {
    NavDestination() {
      Column() {
        if (this.getFavProducts().length === 0) {
          Column({ space: 8 }) {
            Text('暂无收藏')
              .fontSize(14)
              .fontColor('#999999')
            Text('去逛逛喜欢的好物吧')
              .fontSize(12)
              .fontColor('#BBBBBB')
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
        } else {
          Scroll() {
            Column({ space: 10 }) {
              ForEach(this.getFavProducts(), (product: Product) => {
                Row({ space: 12 }) {
                  Image(product.image)
                    .width(88)
                    .height(88)
                    .borderRadius(10)
                    .objectFit(ImageFit.Cover)
                  Column({ space: 8 }) {
                    Text(product.name)
                      .fontSize(14)
                      .fontColor('#222222')
                      .maxLines(2)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .width('100%')
                    Text(`¥${product.price}`)
                      .fontSize(16)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#FF4D2A')
                  }
                  .layoutWeight(1)
                  .alignItems(HorizontalAlign.Start)

                  Text('取消收藏')
                    .fontSize(12)
                    .fontColor('#999999')
                    .border({ width: 1, color: '#DDDDDD' })
                    .borderRadius(14)
                    .padding({ left: 10, right: 10, top: 5, bottom: 5 })
                    .onClick(() => {
                      toggleFavorite(product.id)
                      promptAction.showToast({ message: '已取消收藏' })
                    })
                }
                .width('100%')
                .padding(12)
                .backgroundColor(Color.White)
                .borderRadius(12)
                .alignItems(VerticalAlign.Center)
                .onClick(() => {
                  this.pathStack.pushPathByName('detail', product.id)
                })
              }, (product: Product) => product.id.toString())
            }
            .width('100%')
            .padding({ left: 12, right: 12, top: 12, bottom: 12 })
          }
          .width('100%')
          .layoutWeight(1)
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F6F8')
    }
    .title('我的收藏')
    .backgroundColor('#F5F6F8')
  }
}
