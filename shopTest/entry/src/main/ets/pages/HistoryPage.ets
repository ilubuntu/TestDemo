import { Product, PRODUCTS } from '../model/ShopData'
import { clearHistory } from '../model/ShopStore'
import { promptAction } from '@kit.ArkUI'

@Component
export struct HistoryPage {
  @Consume('navStack') pathStack: NavPathStack
  @StorageLink('historyIds') historyIds: number[] = []

  getHistoryProducts(): Product[] {
    const list: Product[] = []
    this.historyIds.forEach((id: number) => {
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
        if (this.historyIds.length === 0) {
          Column({ space: 8 }) {
            Text('暂无浏览记录')
              .fontSize(14)
              .fontColor('#999999')
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
        } else {
          Row() {
            Text(`最近浏览过 ${this.historyIds.length} 件商品`)
              .fontSize(12)
              .fontColor('#999999')
            Blank()
            Text('清空')
              .fontSize(12)
              .fontColor('#FF6B35')
              .padding({ left: 8, right: 4, top: 4, bottom: 4 })
              .onClick(() => {
                clearHistory()
                promptAction.showToast({ message: '已清空浏览记录' })
              })
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 10, bottom: 10 })

          Scroll() {
            Column({ space: 10 }) {
              ForEach(this.getHistoryProducts(), (product: Product) => {
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

                  Text('>')
                    .fontSize(16)
                    .fontColor('#C8C8C8')
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
            .padding({ left: 12, right: 12, bottom: 12 })
          }
          .width('100%')
          .layoutWeight(1)
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
          .alignSelf(ItemAlign.Start)
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F6F8')
    }
    .title('浏览记录')
    .backgroundColor('#F5F6F8')
  }
}
