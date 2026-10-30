import { Product, CATEGORIES, getProductsByCategory, toRows } from '../model/ShopData'
import { ProductCard } from './ProductCard'

@Component
export struct CategoryPage {
  @Consume('navStack') pathStack: NavPathStack
  @State currentCategory: string = '推荐'
  @State keyword: string = ''

  build() {
    Column() {
      Column() {
        Row() {
          Text('商品')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#222222')
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)

        Row({ space: 8 }) {
          Row() {
            Image($r('app.media.icon_search'))
              .width(16)
              .height(16)
            TextInput({ placeholder: '搜索商品' })
              .layoutWeight(1)
              .height(36)
              .backgroundColor(Color.Transparent)
              .padding({ left: 8, right: 8 })
              .fontSize(13)
              .onChange((value: string) => {
                this.keyword = value
              })
              .onSubmit(() => {
                this.doSearch()
              })
          }
          .layoutWeight(1)
          .height(36)
          .borderRadius(18)
          .backgroundColor('#F1F2F3')
          .alignItems(VerticalAlign.Center)
          .padding({ left: 14, right: 4 })

          Text('搜索')
            .fontSize(14)
            .fontColor(Color.White)
            .height(36)
            .borderRadius(18)
            .backgroundColor('#FF6B35')
            .padding({ left: 16, right: 16 })
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.doSearch()
            })
        }
        .width('100%')
        .margin({ top: 10 })
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 8, bottom: 10 })
      .backgroundColor(Color.White)

      Row() {
        Scroll() {
          Column() {
            ForEach(CATEGORIES, (category: string) => {
              Row() {
                Column()
                  .width(3)
                  .height(18)
                  .backgroundColor(this.currentCategory === category ? '#FF6B35' : 'transparent')
                Text(category)
                  .fontSize(14)
                  .fontColor(this.currentCategory === category ? '#FF6B35' : '#555555')
                  .fontWeight(this.currentCategory === category ? FontWeight.Bold : FontWeight.Normal)
                  .layoutWeight(1)
                  .textAlign(TextAlign.Center)
              }
              .width('100%')
              .height(52)
              .backgroundColor(this.currentCategory === category ? Color.White : '#F2F3F5')
              .onClick(() => {
                this.currentCategory = category
              })
            }, (category: string) => category)
          }
          .width('100%')
        }
        .scrollBar(BarState.Off)
        .align(Alignment.Start)
        .width(88)
        .height('100%')

        Scroll() {
          Column() {
            Text(`${this.currentCategory} · ${getProductsByCategory(this.currentCategory).length}件商品`)
              .fontSize(12)
              .fontColor('#999999')
              .width('100%')
              .margin({ bottom: 10 })
            ForEach(toRows(getProductsByCategory(this.currentCategory)), (row: Product[]) => {
              Row({ space: 8 }) {
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
              .margin({ bottom: 8 })
            }, (row: Product[]) => `${this.currentCategory}-${row[0].id}`)
          }
          .padding(10)
        }
        .scrollBar(BarState.Off)
        .layoutWeight(1)
        .height('100%')
        .backgroundColor(Color.White)
      }
      .layoutWeight(1)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  doSearch(): void {
    const kw: string = this.keyword.trim()
    this.pathStack.pushPathByName('search', kw)
  }
}
