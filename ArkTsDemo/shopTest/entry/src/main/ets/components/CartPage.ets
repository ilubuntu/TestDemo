import { CartItem } from '../model/ShopData'
import { changeCount, removeItem, setSelectAll, toggleSelected, switchTab } from '../model/ShopStore'
import { promptAction } from '@kit.ArkUI'

@Component
export struct CartPage {
  @Consume('navStack') pathStack: NavPathStack
  @StorageLink('cartItems') cartList: CartItem[] = []

  getSelectedItems(): CartItem[] {
    return this.cartList.filter((item: CartItem) => item.selected)
  }

  getSelectedCount(): number {
    let n: number = 0
    this.getSelectedItems().forEach((item: CartItem) => {
      n += item.count
    })
    return n
  }

  getSelectedTotal(): number {
    let total: number = 0
    this.getSelectedItems().forEach((item: CartItem) => {
      total += item.product.price * item.count
    })
    return total
  }

  isAllSelected(): boolean {
    if (this.cartList.length === 0) {
      return false
    }
    return this.getSelectedItems().length === this.cartList.length
  }

  build() {
    Column() {
      Row() {
        Text(`购物车(${this.cartList.length})`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#222222')
        Blank()
        Text('共件数以结算为准')
          .fontSize(11)
          .fontColor('#BBBBBB')
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Color.White)
      .alignItems(VerticalAlign.Center)

      if (this.cartList.length === 0) {
        Column({ space: 12 }) {
          Text('购物车空空如也')
            .fontSize(15)
            .fontColor('#999999')
          Text('去逛逛')
            .fontSize(14)
            .fontColor(Color.White)
            .height(38)
            .borderRadius(19)
            .backgroundColor('#FF6B35')
            .padding({ left: 28, right: 28 })
            .textAlign(TextAlign.Center)
            .onClick(() => {
              switchTab(1)
            })
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else {
        List({ space: 10 }) {
          ForEach(this.cartList, (item: CartItem) => {
            ListItem() {
              Row({ space: 10 }) {
                Checkbox()
                  .select(item.selected)
                  .selectedColor('#FF6B35')
                  .onChange((value: boolean) => {
                    toggleSelected(item.product.id)
                  })

                Image(item.product.image)
                  .width(80)
                  .height(80)
                  .borderRadius(8)
                  .objectFit(ImageFit.Cover)

                Column({ space: 8 }) {
                  Row() {
                    Text(item.product.name)
                      .fontSize(13)
                      .fontColor('#222222')
                      .maxLines(2)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .layoutWeight(1)
                    Text('删除')
                      .fontSize(12)
                      .fontColor('#999999')
                      .padding({ left: 6 })
                      .onClick(() => {
                        removeItem(item.product.id)
                        promptAction.showToast({ message: '已删除' })
                      })
                  }
                  .width('100%')
                  .alignItems(VerticalAlign.Top)

                  Row() {
                    Text(`¥${item.product.price}`)
                      .fontSize(16)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#FF4D2A')
                    Blank()
                    Row({ space: 0 }) {
                      Column() {
                        Text('-')
                          .fontSize(16)
                          .fontColor('#666666')
                      }
                      .width(26)
                      .height(26)
                      .backgroundColor('#F2F3F5')
                      .justifyContent(FlexAlign.Center)
                      .alignItems(HorizontalAlign.Center)
                      .onClick(() => {
                        changeCount(item.product.id, -1)
                      })

                      Text(`${item.count}`)
                        .fontSize(14)
                        .fontColor('#222222')
                        .width(34)
                        .height(26)
                        .backgroundColor('#F7F8F9')
                        .textAlign(TextAlign.Center)

                      Column() {
                        Text('+')
                          .fontSize(16)
                          .fontColor('#666666')
                      }
                      .width(26)
                      .height(26)
                      .backgroundColor('#F2F3F5')
                      .justifyContent(FlexAlign.Center)
                      .alignItems(HorizontalAlign.Center)
                      .onClick(() => {
                        changeCount(item.product.id, 1)
                      })
                    }
                    .alignItems(VerticalAlign.Center)
                  }
                  .width('100%')
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start)
              }
              .width('100%')
              .padding(12)
              .backgroundColor(Color.White)
              .borderRadius(12)
              .alignItems(VerticalAlign.Center)
            }
          }, (item: CartItem) => `${item.product.id}-${item.count}-${item.selected}`)
        }
        .width('100%')
        .layoutWeight(1)
        .padding({ left: 12, right: 12, top: 10, bottom: 10 })
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)

        Row() {
          Checkbox()
            .select(this.isAllSelected())
            .selectedColor('#FF6B35')
            .onChange((value: boolean) => {
              setSelectAll(value)
            })
          Text('全选')
            .fontSize(13)
            .fontColor('#555555')
            .margin({ left: 6 })

          Blank()

          Column({ space: 2 }) {
            Text('合计')
              .fontSize(11)
              .fontColor('#999999')
            Text(`¥${this.getSelectedTotal().toFixed(2)}`)
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF4D2A')
          }
          .alignItems(HorizontalAlign.End)
          .margin({ right: 10 })

          Text(`去结算(${this.getSelectedCount()})`)
            .fontSize(15)
            .fontColor(Color.White)
            .height(42)
            .borderRadius(21)
            .backgroundColor(this.getSelectedCount() > 0 ? '#FF6B35' : '#C8C8C8')
            .padding({ left: 22, right: 22 })
            .textAlign(TextAlign.Center)
            .onClick(() => {
              if (this.getSelectedCount() === 0) {
                promptAction.showToast({ message: '请至少选择一件商品' })
                return
              }
              this.pathStack.pushPathByName('payment', this.getSelectedItems())
            })
        }
        .width('100%')
        .height(64)
        .padding({ left: 16, right: 14 })
        .backgroundColor(Color.White)
        .alignItems(VerticalAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6F8')
  }
}
