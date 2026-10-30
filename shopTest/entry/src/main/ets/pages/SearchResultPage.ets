import { Product, HOT_KEYWORDS, searchProducts, toRows } from '../model/ShopData'
import { ProductCard } from '../components/ProductCard'
import { promptAction } from '@kit.ArkUI'

@Component
export struct SearchResultPage {
  @Consume('navStack') pathStack: NavPathStack
  @State keyword: string = ''
  @State searched: boolean = false
  @State results: Product[] = []
  @State sortMode: number = 0

  aboutToAppear(): void {
    const params: Array<ESObject> = this.pathStack.getParamByName('search')
    if (params.length > 0 && params[0] !== undefined) {
      const kw: string = params[0] as string
      if (kw.length > 0) {
        this.keyword = kw
        this.doSearch(kw)
      }
    }
  }

  doSearch(word: string): void {
    const kw: string = word.trim()
    if (kw.length === 0) {
      promptAction.showToast({ message: '请输入关键词' })
      return
    }
    this.keyword = kw
    this.results = searchProducts(kw)
    this.searched = true
  }

  getSortedResults(): Product[] {
    if (this.sortMode === 1) {
      return this.results.slice().sort((a: Product, b: Product) => b.sales - a.sales)
    }
    if (this.sortMode === 2) {
      return this.results.slice().sort((a: Product, b: Product) => a.price - b.price)
    }
    return this.results
  }

  @Builder
  sortItem(label: string, mode: number) {
    Text(label)
      .fontSize(13)
      .fontColor(this.sortMode === mode ? '#FF4D2A' : '#555555')
      .fontWeight(this.sortMode === mode ? FontWeight.Bold : FontWeight.Normal)
      .padding({ left: 10, right: 10 })
      .onClick(() => {
        this.sortMode = mode
      })
  }

  build() {
    NavDestination() {
      Column() {
        Row({ space: 10 }) {
          Text('<')
            .fontSize(24)
            .fontColor('#222222')
            .width(32)
            .height(40)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.pathStack.pop()
            })

          Row() {
            Image($r('app.media.icon_search'))
              .width(16)
              .height(16)
            TextInput({ placeholder: '搜索商品', text: this.keyword })
              .layoutWeight(1)
              .height(40)
              .backgroundColor(Color.Transparent)
              .padding({ left: 8, right: 8 })
              .fontSize(14)
              .defaultFocus(this.keyword.length === 0)
              .onChange((value: string) => {
                this.keyword = value
              })
              .onSubmit(() => {
                this.doSearch(this.keyword)
              })
          }
          .layoutWeight(1)
          .height(40)
          .borderRadius(20)
          .backgroundColor('#F1F2F3')
          .alignItems(VerticalAlign.Center)
          .padding({ left: 14, right: 6 })

          Text('搜索')
            .fontSize(15)
            .fontColor('#FF6B35')
            .fontWeight(FontWeight.Medium)
            .onClick(() => {
              this.doSearch(this.keyword)
            })
        }
        .width('100%')
        .padding({ left: 12, right: 16, top: 4, bottom: 8 })
        .alignItems(VerticalAlign.Center)

        if (!this.searched) {
          Scroll() {
            Column() {
              Text('热门搜索')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor('#222222')
                .width('100%')
              Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
                ForEach(HOT_KEYWORDS, (word: string) => {
                  Text(word)
                    .fontSize(13)
                    .fontColor('#555555')
                    .backgroundColor('#F1F2F3')
                    .borderRadius(14)
                    .padding({ left: 14, right: 14, top: 7, bottom: 7 })
                    .margin({ right: 8, bottom: 10 })
                    .onClick(() => {
                      this.doSearch(word)
                    })
                }, (word: string) => word)
              }
              .width('100%')
              .margin({ top: 14 })
            }
            .alignItems(HorizontalAlign.Start)
            .padding(16)
          }
          .width('100%')
          .layoutWeight(1)
          .scrollBar(BarState.Off)
        } else {
          Column() {
            Row() {
              this.sortItem('综合', 0)
              this.sortItem('销量', 1)
              this.sortItem('价格', 2)
              Blank()
              Text(`${this.results.length}件相关商品`)
                .fontSize(11)
                .fontColor('#999999')
            }
            .width('100%')
            .height(40)
            .padding({ left: 8, right: 14 })
            .backgroundColor(Color.White)
            .alignItems(VerticalAlign.Center)

            if (this.results.length === 0) {
              Column() {
                Text(`未找到与「${this.keyword}」相关的商品`)
                  .fontSize(14)
                  .fontColor('#999999')
                Text('换个关键词试试吧')
                  .fontSize(12)
                  .fontColor('#BBBBBB')
                  .margin({ top: 8 })
              }
              .width('100%')
              .layoutWeight(1)
              .justifyContent(FlexAlign.Center)
            } else {
              Scroll() {
                Column() {
                  ForEach(toRows(this.getSortedResults()), (row: Product[]) => {
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
                    .margin({ bottom: 10 })
                  }, (row: Product[]) => row[0].id.toString())
                }
                .padding({ left: 12, right: 12, top: 10, bottom: 12 })
              }
              .width('100%')
              .layoutWeight(1)
              .scrollBar(BarState.Off)
              .edgeEffect(EdgeEffect.Spring)
            }
          }
          .width('100%')
          .layoutWeight(1)
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F6F8')
    }
    .hideTitleBar(true)
    .backgroundColor('#F5F6F8')
  }
}
