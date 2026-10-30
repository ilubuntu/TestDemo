import { Product, createEmptyProduct, formatSales } from '../model/ShopData'
import { addToCart } from '../model/ShopStore'
import { promptAction } from '@kit.ArkUI'

@Component
export struct ProductCard {
  @Prop product: Product = createEmptyProduct()
  onCardClick: (product: Product) => void = () => {
  }

  build() {
    Column() {
      Image(this.product.image)
        .width('100%')
        .height(150)
        .objectFit(ImageFit.Cover)

      Column({ space: 6 }) {
        Text(this.product.name)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#222222')
          .maxLines(2)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
        Text(this.product.desc)
          .fontSize(11)
          .fontColor('#999999')
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
        Row() {
          Text(`¥${this.product.price}`)
            .fontSize(17)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF4D2A')
          Text(`¥${this.product.originalPrice}`)
            .fontSize(11)
            .fontColor('#999999')
            .decoration({ type: TextDecorationType.LineThrough })
            .margin({ left: 6 })
        }
        .width('100%')
        .alignItems(VerticalAlign.Bottom)

        Row() {
          Text(`已售${formatSales(this.product.sales)}`)
            .fontSize(11)
            .fontColor('#999999')
          Blank()
          Column() {
            Text('+')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
          }
          .width(24)
          .height(24)
          .borderRadius(12)
          .backgroundColor('#FF6B35')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .onClick(() => {
            addToCart(this.product, 1)
            promptAction.showToast({ message: '已加入购物车' })
          })
        }
        .width('100%')
      }
      .padding(10)
      .alignItems(HorizontalAlign.Start)
    }
    .layoutWeight(1)
    .borderRadius(12)
    .backgroundColor(Color.White)
    .clip(true)
    .onClick(() => {
      this.onCardClick(this.product)
    })
  }
}
