import { Theme } from '../common/Theme';
import {
  BookInfo,
  CATEGORY_LIST,
  filterBooks,
  isInShelf,
  toggleShelf
} from '../model/BookData';

const ALL_BOOKS_INIT: BookInfo[] = filterBooks('全部', '');

@Component
export struct BookStoreComp {
  onOpenBook: (id: number) => void = (id: number) => {};
  @State keyword: string = '';
  @State selectedCategory: string = '全部';
  @State displayBooks: BookInfo[] = ALL_BOOKS_INIT;
  @StorageProp('topInset') topInset: number = 0;

  refresh(): void {
    this.displayBooks = filterBooks(this.selectedCategory, this.keyword);
  }

  @Builder
  searchBox() {
    Row({ space: 8 }) {
      TextInput({ placeholder: '搜索书名 / 作者', text: this.keyword })
        .placeholderColor('#FFFFFF88')
        .placeholderFont({ size: 14 })
        .fontColor(Color.White)
        .fontSize(14)
        .backgroundColor(Color.Transparent)
        .padding(0)
        .layoutWeight(1)
        .onChange((value: string) => {
          this.keyword = value;
          this.refresh();
        })
        .onSubmit(() => {
          this.refresh();
        })
    }
    .width('100%')
    .height(36)
    .padding({ left: 12, right: 12 })
    .borderRadius(18)
    .backgroundColor('#33FFFFFF')
  }

  @Builder
  categoryItem(cat: string) {
    Column() {
      Text(cat)
        .fontSize(14)
        .fontColor(this.selectedCategory === cat ? Theme.PRIMARY : Theme.TEXT_MAIN)
        .fontWeight(this.selectedCategory === cat ? FontWeight.Bold : FontWeight.Normal)
      Column()
        .width(16)
        .height(2)
        .borderRadius(1)
        .backgroundColor(this.selectedCategory === cat ? Theme.PRIMARY : Color.Transparent)
        .margin({ top: 6 })
    }
    .width('100%')
    .height(48)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.selectedCategory === cat ? '#FFF1EC' : Color.Transparent)
    .onClick(() => {
      this.selectedCategory = cat;
      this.refresh();
    })
  }

  @Builder
  bookItem(book: BookInfo) {
    Row({ space: 12 }) {
      // 左侧封面 + 信息区域：点击进入书籍内容页
      Row({ space: 12 })
        .layoutWeight(1)
        .onClick(() => {
          this.onOpenBook(book.id);
        }) {
        Column({ space: 6 }) {
          Text(book.title.substring(0, 1))
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
        }
        .width(60)
        .height(84)
        .borderRadius(6)
        .justifyContent(FlexAlign.Center)
        .linearGradient({
          angle: 135,
          colors: [[book.coverColor, 0.0], [Theme.PRIMARY_DARK, 1.0]]
        })

        Column({ space: 5 }) {
          Text(book.title)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(Theme.TEXT_MAIN)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text(`${book.author} · ${book.category}`)
            .fontSize(12)
            .fontColor(Theme.TEXT_SUB)
          Text(book.intro)
            .fontSize(12)
            .fontColor(Theme.TEXT_SUB)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
      }

      // 右侧操作区域：加入/移出书架
      Text(isInShelf(book.id) ? '已在书架' : '加入书架')
        .fontSize(12)
        .fontColor(isInShelf(book.id) ? Theme.TEXT_SUB : Theme.PRIMARY)
        .padding({ left: 8, right: 8, top: 5, bottom: 5 })
        .borderRadius(12)
        .border({ width: 1, color: isInShelf(book.id) ? Theme.DIVIDER : Theme.PRIMARY })
        .onClick(() => {
          toggleShelf(book.id);
          this.refresh();
        })
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Theme.BG_CARD)
    .borderRadius(10)
  }

  build() {
    Column() {
      // 沉浸式顶栏：背景延伸到状态栏下
      Column({ space: 10 }) {
        Text('书城')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        this.searchBox()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: this.topInset + 8, bottom: 12 })
      .backgroundColor(Theme.PRIMARY)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])

      Row() {
        // 左侧分类列表
        List() {
          ForEach(CATEGORY_LIST, (cat: string) => {
            ListItem() {
              this.categoryItem(cat)
            }
          }, (cat: string) => cat)
        }
        .width(88)
        .height('100%')
        .scrollBar(BarState.Off)
        .backgroundColor(Theme.BG_CARD)

        // 右侧书籍列表
        Column() {
          if (this.displayBooks.length === 0) {
            Column({ space: 8 }) {
              Text('没有找到相关书籍')
                .fontSize(14)
                .fontColor(Theme.TEXT_SUB)
              Text('换个分类或关键词试试')
                .fontSize(12)
                .fontColor(Theme.TEXT_SUB)
            }
            .width('100%')
            .layoutWeight(1)
            .justifyContent(FlexAlign.Center)
          } else {
            List({ space: 10 }) {
              ForEach(this.displayBooks, (book: BookInfo) => {
                ListItem() {
                  this.bookItem(book)
                }
              }, (book: BookInfo) => book.id.toString())
            }
            .layoutWeight(1)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
          }
        }
        .layoutWeight(1)
        .height('100%')
        .padding(10)
      }
      .width('100%')
      .layoutWeight(1)
      .alignItems(VerticalAlign.Top)
    }
    .width('100%')
    .height('100%')
  }
}
