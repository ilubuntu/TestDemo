import { Theme } from '../common/Theme';
import { BookInfo, DEFAULT_SHELF_IDS, getBookById, SHELF_KEY } from '../model/BookData';

@Component
export struct BookShelfComp {
  onOpenBook: (id: number) => void = (id: number) => {};
  onAddBook: () => void = () => {};
  @StorageLink(SHELF_KEY) shelfIds: number[] = DEFAULT_SHELF_IDS;
  @StorageProp('topInset') topInset: number = 0;

  getShelfList(): BookInfo[] {
    const books: BookInfo[] = [];
    for (const id of this.shelfIds) {
      const book = getBookById(id);
      if (book !== undefined) {
        books.push(book);
      }
    }
    return books;
  }

  @Builder
  bookCell(book: BookInfo) {
    Column({ space: 8 }) {
      Column({ space: 6 }) {
        Text(book.title)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .maxLines(2)
          .textAlign(TextAlign.Center)
          .padding({ left: 8, right: 8 })
        Text(book.author)
          .fontSize(12)
          .fontColor('#FFFFFFCC')
          .maxLines(1)
      }
      .width('100%')
      .height(120)
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .linearGradient({
        angle: 160,
        colors: [[book.coverColor, 0.0], ['#33333388', 1.0]]
      })
      .onClick(() => {
        this.onOpenBook(book.id);
      })

      Text(book.title)
        .fontSize(13)
        .fontColor(Theme.TEXT_MAIN)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')
        .textAlign(TextAlign.Center)
    }
    .width('100%')
  }

  @Builder
  addCell() {
    Column({ space: 8 }) {
      Column({ space: 6 }) {
        Text('+')
          .fontSize(34)
          .fontColor(Theme.TEXT_SUB)
        Text('添加书籍')
          .fontSize(12)
          .fontColor(Theme.TEXT_SUB)
      }
      .width('100%')
      .height(120)
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .border({ width: 1, color: '#DDDDDD', style: BorderStyle.Dashed })
      .onClick(() => {
        this.onAddBook();
      })

      Text('去书城挑一本')
        .fontSize(13)
        .fontColor(Theme.TEXT_SUB)
        .width('100%')
        .textAlign(TextAlign.Center)
    }
    .width('100%')
  }

  build() {
    Column() {
      // 沉浸式顶栏
      Column() {
        Text('书架')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text(`已收藏 ${this.shelfIds.length} 本`)
          .fontSize(12)
          .fontColor('#FFFFFFCC')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: this.topInset + 8, bottom: 12 })
      .alignItems(HorizontalAlign.Start)
      .backgroundColor(Theme.PRIMARY)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])

      if (this.shelfIds.length === 0) {
        Column({ space: 12 }) {
          Text('书架还是空的')
            .fontSize(16)
            .fontColor(Theme.TEXT_MAIN)
          Text('点击下方按钮去书城添加喜欢的书')
            .fontSize(13)
            .fontColor(Theme.TEXT_SUB)
          Text('去添加')
            .fontSize(14)
            .fontColor(Color.White)
            .padding({ left: 20, right: 20, top: 8, bottom: 8 })
            .borderRadius(18)
            .backgroundColor(Theme.PRIMARY)
            .onClick(() => {
              this.onAddBook();
            })
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else {
        Grid() {
          ForEach(this.getShelfList(), (book: BookInfo) => {
            GridItem() {
              this.bookCell(book)
            }
          }, (book: BookInfo) => book.id.toString())
          GridItem() {
            this.addCell()
          }
        }
        .columnsTemplate('1fr 1fr 1fr')
        .columnsGap(12)
        .rowsGap(14)
        .padding(16)
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      }
    }
    .width('100%')
    .height('100%')
  }
}
