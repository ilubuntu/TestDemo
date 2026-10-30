import { CartItem } from '../model/ShopData'
import { addOrder, clearCartByIds, switchTab } from '../model/ShopStore'

@Component
export struct PaymentPage {
  @Consume('navStack') pathStack: NavPathStack
  @State items: CartItem[] = []
  @State payMethod: number = 0
  @State paid: boolean = false
  @State payTotal: number = 0

  aboutToAppear(): void {
    const params: Array<ESObject> = this.pathStack.getParamByName('payment')
    if (params.length > 0 && params[0] !== undefined) {
      this.items = params[0] as CartItem[]
    }
    this.payTotal = this.getTotal()
  }

  getTotal(): number {
    let total: number = 0
    this.items.forEach((item: CartItem) => {
      total += item.product.price * item.count
    })
    return total
  }

  finishPay(): void {
    addOrder(this.items, this.getTotal())
    const ids: number[] = []
    this.items.forEach((item: CartItem) => {
      ids.push(item.product.id)
    })
    clearCartByIds(ids)
    this.paid = true
  }

  @Builder
  payMethodItem(index: number, char: string, bgColor: string, label: string) {
    Row() {
      Column() {
        Text(char)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .width(32)
      .height(32)
      .borderRadius(16)
      .backgroundColor(bgColor)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)

      Text(label)
        .fontSize(14)
        .fontColor('#222222')
        .margin({ left: 12 })
        .layoutWeight(1)

      if (this.payMethod === index) {
        Circle()
          .width(18)
          .height(18)
          .fill('#FF6B35')
          .stroke('#FF6B35')
          .strokeWidth(1)
      } else {
        Circle()
          .width(18)
          .height(18)
          .fill(Color.Transparent)
          .stroke('#CCCCCC')
          .strokeWidth(1)
      }
    }
    .width('100%')
    .height(52)
    .padding({ left: 14, right: 14 })
    .onClick(() => {
      this.payMethod = index
    })
  }

  build() {
    NavDestination() {
      if (!this.paid) {
        Column() {
          Scroll() {
            Column() {
              Row() {
                Column({ space: 4 }) {
                  Text('张三 138****6666')
                    .fontSize(15)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#222222')
                  Text('广东省深圳市南山区科技园南路88号优选大厦A座')
                    .fontSize(12)
                    .fontColor('#999999')
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
                Text('>')
                  .fontSize(16)
                  .fontColor('#C8C8C8')
              }
              .width('100%')
              .padding(14)
              .backgroundColor(Color.White)
              .borderRadius(12)
              .alignItems(VerticalAlign.Center)

              Column({ space: 10 }) {
                ForEach(this.items, (item: CartItem) => {
                  Row({ space: 10 }) {
                    Image(item.product.image)
                      .width(60)
                      .height(60)
                      .borderRadius(8)
                      .objectFit(ImageFit.Cover)
                    Column({ space: 6 }) {
                      Text(item.product.name)
                        .fontSize(13)
                        .fontColor('#222222')
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .width('100%')
                      Text('默认规格')
                        .fontSize(11)
                        .fontColor('#999999')
                    }
                    .layoutWeight(1)
                    .alignItems(HorizontalAlign.Start)
                    Column({ space: 4 }) {
                      Text(`¥${(item.product.price * item.count).toFixed(2)}`)
                        .fontSize(14)
                        .fontWeight(FontWeight.Bold)
                        .fontColor('#222222')
                      Text(`x${item.count}`)
                        .fontSize(11)
                        .fontColor('#999999')
                    }
                    .alignItems(HorizontalAlign.End)
                  }
                  .width('100%')
                  .alignItems(VerticalAlign.Top)
                }, (item: CartItem) => `${item.product.id}-${item.count}`)
              }
              .width('100%')
              .padding(14)
              .backgroundColor(Color.White)
              .borderRadius(12)
              .margin({ top: 10 })

              Column() {
                Row() {
                  Text('商品金额')
                    .fontSize(13)
                    .fontColor('#666666')
                  Blank()
                  Text(`¥${this.getTotal().toFixed(2)}`)
                    .fontSize(13)
                    .fontColor('#222222')
                }
                .width('100%')
                .height(40)
                Row() {
                  Text('活动优惠')
                    .fontSize(13)
                    .fontColor('#666666')
                  Blank()
                  Text('-¥0.00')
                    .fontSize(13)
                    .fontColor('#222222')
                }
                .width('100%')
                .height(40)
                Row() {
                  Text('运费')
                    .fontSize(13)
                    .fontColor('#666666')
                  Blank()
                  Text('免运费')
                    .fontSize(13)
                    .fontColor('#00B894')
                }
                .width('100%')
                .height(40)
                Divider()
                  .color('#F0F0F0')
                Row() {
                  Text('实付款')
                    .fontSize(14)
                    .fontWeight(FontWeight.Medium)
                    .fontColor('#222222')
                  Blank()
                  Text(`¥${this.getTotal().toFixed(2)}`)
                    .fontSize(17)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#FF4D2A')
                }
                .width('100%')
                .height(48)
              }
              .width('100%')
              .padding({ left: 14, right: 14 })
              .backgroundColor(Color.White)
              .borderRadius(12)
              .margin({ top: 10 })

              Column() {
                Text('支付方式')
                  .fontSize(15)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#222222')
                  .width('100%')
                  .padding({ left: 14, top: 12, bottom: 4 })
                this.payMethodItem(0, '微', '#00C250', '微信支付')
                Divider()
                  .color('#F0F0F0')
                  .margin({ left: 14 })
                this.payMethodItem(1, '支', '#1677FF', '支付宝')
                Divider()
                  .color('#F0F0F0')
                  .margin({ left: 14 })
                this.payMethodItem(2, '云', '#E6A23C', '云闪付')
              }
              .width('100%')
              .backgroundColor(Color.White)
              .borderRadius(12)
              .margin({ top: 10, bottom: 12 })
              .clip(true)
            }
            .width('100%')
            .padding({ left: 12, right: 12, top: 10 })
          }
          .width('100%')
          .layoutWeight(1)
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
          .backgroundColor('#F5F6F8')

          Row() {
            Text('合计:')
              .fontSize(14)
              .fontColor('#666666')
            Text(`¥${this.getTotal().toFixed(2)}`)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF4D2A')
              .margin({ left: 6 })
            Blank()
            Text('立即支付')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
              .height(44)
              .borderRadius(22)
              .backgroundColor('#FF6B35')
              .padding({ left: 34, right: 34 })
              .textAlign(TextAlign.Center)
              .onClick(() => {
                this.finishPay()
              })
          }
          .width('100%')
          .height(64)
          .padding({ left: 16, right: 12 })
          .backgroundColor(Color.White)
          .alignItems(VerticalAlign.Center)
        }
        .width('100%')
        .height('100%')
      } else {
        Column({ space: 14 }) {
          Column() {
            Text('✓')
              .fontSize(40)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
          }
          .width(84)
          .height(84)
          .borderRadius(42)
          .backgroundColor('#00B894')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .margin({ top: 100 })

          Text('支付成功')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#222222')
          Text(`实付 ¥${this.payTotal.toFixed(2)}`)
            .fontSize(14)
            .fontColor('#999999')

          Row({ space: 12 }) {
            Text('查看订单')
              .fontSize(14)
              .fontColor('#FF6B35')
              .height(42)
              .borderRadius(21)
              .border({ width: 1, color: '#FF6B35' })
              .padding({ left: 26, right: 26 })
              .textAlign(TextAlign.Center)
              .onClick(() => {
                this.pathStack.replacePathByName('orders', '')
              })
            Text('返回首页')
              .fontSize(14)
              .fontColor(Color.White)
              .height(42)
              .borderRadius(21)
              .backgroundColor('#FF6B35')
              .padding({ left: 26, right: 26 })
              .textAlign(TextAlign.Center)
              .onClick(() => {
                switchTab(0)
                this.pathStack.pop()
              })
          }
          .margin({ top: 20 })
        }
        .width('100%')
        .height('100%')
        .alignItems(HorizontalAlign.Center)
        .backgroundColor(Color.White)
      }
    }
    .hideTitleBar(true)
    .backgroundColor('#F5F6F8')
  }
}
