import { Product, CartItem, getProductById, createEmptyProduct } from '../model/ShopData'
import { addHistory, addToCart, toggleFavorite } from '../model/ShopStore'
import { promptAction } from '@kit.ArkUI'

@Component
export struct ProductDetailPage {
  @Consume('navStack') pathStack: NavPathStack
  @StorageLink('favIds') favIds: number[] = []
  @State product: Product = createEmptyProduct()
  @State count: number = 1
  @State found: boolean = true

  aboutToAppear(): void {
    const params: Array<ESObject> = this.pathStack.getParamByName('detail')
    if (params.length > 0 && params[0] !== undefined) {
      const id: number = params[0] as number
      const target: Product | undefined = getProductById(id)
      if (target !== undefined) {
        this.product = target
        addHistory(id)
      } else {
        this.found = false
      }
    }
  }

  isFavorite(): boolean {
    return this.favIds.indexOf(this.product.id) >= 0
  }

  build() {
    NavDestination() {
      Column() {
        if (this.found) {
          Column() {
            Scroll() {
              Column() {
                Image(this.product.image)
                  .width('100%')
                  .height(320)
                  .objectFit(ImageFit.Cover)

                Column({ space: 10 }) {
                  Row() {
                    Text(`¥${this.product.price}`)
                      .fontSize(26)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#FF4D2A')
                    Text(`¥${this.product.originalPrice}`)
                      .fontSize(13)
                      .fontColor('#999999')
                      .decoration({ type: TextDecorationType.LineThrough })
                      .margin({ left: 8 })
                    Blank()
                    Text(`已售${this.product.sales}`)
                      .fontSize(12)
                      .fontColor('#999999')
                  }
                  .width('100%')
                  .alignItems(VerticalAlign.Bottom)

                  Text(this.product.name)
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#222222')
                    .width('100%')

                  Text(this.product.desc)
                    .fontSize(13)
                    .fontColor('#999999')
                    .width('100%')

                  Row({ space: 8 }) {
                    Text('正品保障')
                      .fontSize(11)
                      .fontColor('#FF6B35')
                      .backgroundColor('#FFF1E8')
                      .borderRadius(4)
                      .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                    Text('七天无理由')
                      .fontSize(11)
                      .fontColor('#FF6B35')
                      .backgroundColor('#FFF1E8')
                      .borderRadius(4)
                      .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                    Text('顺丰包邮')
                      .fontSize(11)
                      .fontColor('#FF6B35')
                      .backgroundColor('#FFF1E8')
                      .borderRadius(4)
                      .padding({ left: 8, right: 8, top: 3, bottom: 3 })
                  }
                  .width('100%')
                }
                .padding(14)
                .backgroundColor(Color.White)
                .alignItems(HorizontalAlign.Start)

                Row() {
                  Text('已选')
                    .fontSize(13)
                    .fontColor('#999999')
                  Text(`默认规格 x${this.count}`)
                    .fontSize(13)
                    .fontColor('#222222')
                    .margin({ left: 12 })
                  Blank()
                  Row() {
                    Column() {
                      Text('-')
                        .fontSize(16)
                        .fontColor('#666666')
                    }
                    .width(28)
                    .height(28)
                    .backgroundColor('#F2F3F5')
                    .justifyContent(FlexAlign.Center)
                    .alignItems(HorizontalAlign.Center)
                    .onClick(() => {
                      if (this.count > 1) {
                        this.count -= 1
                      }
                    })
                    Text(`${this.count}`)
                      .fontSize(14)
                      .width(36)
                      .height(28)
                      .backgroundColor('#F7F8F9')
                      .textAlign(TextAlign.Center)
                    Column() {
                      Text('+')
                        .fontSize(16)
                        .fontColor('#666666')
                    }
                    .width(28)
                    .height(28)
                    .backgroundColor('#F2F3F5')
                    .justifyContent(FlexAlign.Center)
                    .alignItems(HorizontalAlign.Center)
                    .onClick(() => {
                      if (this.count < 99) {
                        this.count += 1
                      }
                    })
                  }
                  .alignItems(VerticalAlign.Center)
                }
                .width('100%')
                .padding(14)
                .backgroundColor(Color.White)
                .margin({ top: 10 })

                Column({ space: 12 }) {
                  Text('商品详情')
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#222222')
                    .width('100%')
                  Text('精选优质原料，工艺考究，品质层层把关，为你带来安心的购物体验。')
                    .fontSize(13)
                    .fontColor('#666666')
                    .lineHeight(22)
                    .width('100%')
                  Text('售后说明：签收后7天内保持商品完好可申请无理由退货；质量问题支持退换，运费由商家承担。')
                    .fontSize(13)
                    .fontColor('#666666')
                    .lineHeight(22)
                    .width('100%')
                }
                .padding(14)
                .backgroundColor(Color.White)
                .margin({ top: 10, bottom: 12 })
                .alignItems(HorizontalAlign.Start)
              }
              .width('100%')
            }
            .width('100%')
            .layoutWeight(1)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .backgroundColor('#F5F6F8')

            Row() {
              Column({ space: 2 }) {
                Text(this.isFavorite() ? '已收藏' : '收藏')
                  .fontSize(13)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(this.isFavorite() ? '#FF4D2A' : '#666666')
              }
              .width(56)
              .height('100%')
              .justifyContent(FlexAlign.Center)
              .alignItems(HorizontalAlign.Center)
              .onClick(() => {
                const nowFav: boolean = toggleFavorite(this.product.id)
                promptAction.showToast({ message: nowFav ? '收藏成功' : '已取消收藏' })
              })

              Text('加入购物车')
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor('#FF6B35')
                .layoutWeight(1)
                .height(44)
                .borderRadius({ topLeft: 22, bottomLeft: 22 })
                .border({ width: 1, color: '#FF6B35' })
                .textAlign(TextAlign.Center)
                .margin({ left: 8 })
                .onClick(() => {
                  addToCart(this.product, this.count)
                  promptAction.showToast({ message: '已加入购物车' })
                })

              Text('立即购买')
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor(Color.White)
                .layoutWeight(1)
                .height(44)
                .borderRadius({ topRight: 22, bottomRight: 22 })
                .backgroundColor('#FF6B35')
                .textAlign(TextAlign.Center)
                .margin({ left: 8, right: 12 })
                .onClick(() => {
                  const item: CartItem = { product: this.product, count: this.count, selected: true }
                  this.pathStack.pushPathByName('payment', [item])
                })
            }
            .width('100%')
            .height(64)
            .backgroundColor(Color.White)
            .alignItems(VerticalAlign.Center)
          }
          .width('100%')
          .height('100%')
          .constraintSize({ maxWidth: 640 })
        } else {
          Column() {
            Text('商品不存在或已下架')
              .fontSize(15)
              .fontColor('#999999')
          }
          .width('100%')
          .height('100%')
          .constraintSize({ maxWidth: 640 })
          .justifyContent(FlexAlign.Center)
        }
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .title('商品详情')
    .backgroundColor('#F5F6F8')
  }
}
