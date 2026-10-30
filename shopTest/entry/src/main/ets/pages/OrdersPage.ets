import { CartItem, OrderRecord } from '../model/ShopData'

@Component
export struct OrdersPage {
  @Consume('navStack') pathStack: NavPathStack
  @StorageLink('orders') orders: OrderRecord[] = []

  build() {
    NavDestination() {
      Column() {
        if (this.orders.length === 0) {
          Column() {
            Text('暂无订单')
              .fontSize(14)
              .fontColor('#999999')
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
        } else {
          Scroll() {
            Column({ space: 10 }) {
              ForEach(this.orders, (order: OrderRecord) => {
                Column() {
                  Row() {
                    Text(`订单号 ${order.orderId}`)
                      .fontSize(12)
                      .fontColor('#999999')
                    Blank()
                    Text(order.status)
                      .fontSize(12)
                      .fontWeight(FontWeight.Medium)
                      .fontColor(order.status === '已完成' ? '#00B894' : '#FF6B35')
                  }
                  .width('100%')

                  Column({ space: 8 }) {
                    ForEach(order.items, (item: CartItem) => {
                      Row({ space: 10 }) {
                        Image(item.product.image)
                          .width(56)
                          .height(56)
                          .borderRadius(8)
                          .objectFit(ImageFit.Cover)
                        Text(item.product.name)
                          .fontSize(13)
                          .fontColor('#222222')
                          .maxLines(1)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .layoutWeight(1)
                        Text(`x${item.count}`)
                          .fontSize(12)
                          .fontColor('#999999')
                      }
                      .width('100%')
                      .alignItems(VerticalAlign.Center)
                    }, (item: CartItem) => `${order.orderId}-${item.product.id}-${item.count}`)
                  }
                  .width('100%')
                  .margin({ top: 10 })

                  Divider()
                    .color('#F0F0F0')
                    .margin({ top: 10 })

                  Row() {
                    Text(order.time)
                      .fontSize(11)
                      .fontColor('#BBBBBB')
                    Blank()
                    Text(`实付 ¥${order.total.toFixed(2)}`)
                      .fontSize(15)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#FF4D2A')
                  }
                  .width('100%')
                  .margin({ top: 10 })
                }
                .padding(14)
                .backgroundColor(Color.White)
                .borderRadius(12)
                .alignItems(HorizontalAlign.Start)
              }, (order: OrderRecord) => `${order.orderId}-${order.items.length}`)
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
    .title('我的订单')
    .backgroundColor('#F5F6F8')
  }
}
