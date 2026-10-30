import { Theme } from '../common/Theme';
import {
  BookInfo,
  DEFAULT_SHELF_IDS,
  getBookById,
  getChapterContent,
  getChapters,
  isInShelf,
  SHELF_KEY,
  toggleShelf
} from '../model/BookData';

const EMPTY_BOOK: BookInfo = {
  id: -1,
  title: '',
  author: '',
  category: '',
  coverColor: '#CCCCCC',
  intro: ''
};

@Component
export struct BookContentPage {
  @State book: BookInfo = EMPTY_BOOK;
  @State currentChapter: number = -1;
  @StorageLink(SHELF_KEY) shelfIds: number[] = DEFAULT_SHELF_IDS;
  @StorageProp('topInset') topInset: number = 0;
  @StorageProp('bottomInset') bottomInset: number = 0;
  @StorageProp('nightMode') nightMode: boolean = false;
  @StorageProp('readFontSize') readFontSize: number = 18;
  private pathStack: NavPathStack | null = null;

  @Builder
  header() {
    Row({ space: 8 }) {
      Text('<')
        .fontSize(24)
        .fontColor(Color.White)
        .width(36)
        .height(36)
        .textAlign(TextAlign.Center)
        .onClick(() => {
          this.pathStack?.pop();
        })

      Text(this.book.title)
        .fontSize(17)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.White)
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .layoutWeight(1)

      Text(isInShelf(this.book.id) ? '已在书架' : '加入书架')
        .fontSize(12)
        .fontColor(Color.White)
        .padding({ left: 10, right: 10, top: 5, bottom: 5 })
        .borderRadius(12)
        .border({ width: 1, color: '#FFFFFF88' })
        .onClick(() => {
          toggleShelf(this.book.id);
        })
    }
    .width('100%')
    .height(48)
    .padding({ left: 8, right: 12 })
    .backgroundColor(Theme.PRIMARY)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])
  }

  @Builder
  bookInfoCard() {
    Row({ space: 14 }) {
      Column({ space: 8 }) {
        Text(this.book.title)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .maxLines(2)
          .textAlign(TextAlign.Center)
          .padding({ left: 10, right: 10 })
      }
      .width(100)
      .height(140)
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)
      .linearGradient({
        angle: 160,
        colors: [[this.book.coverColor, 0.0], ['#33333388', 1.0]]
      })

      Column({ space: 8 }) {
        Text(this.book.title)
          .fontSize(19)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.TEXT_MAIN)
          .maxLines(2)
        Text(`${this.book.author} · ${this.book.category}`)
          .fontSize(13)
          .fontColor(Theme.TEXT_SUB)
        Text(this.book.intro)
          .fontSize(13)
          .fontColor(Theme.TEXT_SUB)
          .lineHeight(20)
        Text('开始阅读')
          .fontSize(14)
          .fontColor(Color.White)
          .padding({ left: 22, right: 22, top: 8, bottom: 8 })
          .borderRadius(18)
          .backgroundColor(Theme.PRIMARY)
          .onClick(() => {
            this.currentChapter = 0;
          })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Theme.BG_CARD)
    .borderRadius(10)
    .alignItems(VerticalAlign.Top)
  }

  @Builder
  chapterList() {
    Column({ space: 0 }) {
      Text('目录（共 12 章）')
        .fontSize(15)
        .fontWeight(FontWeight.Bold)
        .fontColor(Theme.TEXT_MAIN)
        .padding({ left: 4, top: 10, bottom: 8 })

      Column() {
        ForEach(getChapters(this.book), (chapter: string, index: number) => {
          Text(chapter)
            .fontSize(14)
            .fontColor(Theme.TEXT_MAIN)
            .width('100%')
            .padding({ top: 11, bottom: 11 })
            .border({ width: { bottom: 1 }, color: Theme.DIVIDER })
            .onClick(() => {
              this.currentChapter = index;
            })
        }, (chapter: string) => chapter)
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
      .backgroundColor(Theme.BG_CARD)
      .borderRadius(10)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  @Builder
  readingView() {
    Column() {
      Scroll() {
        Column({ space: 12 }) {
          Text(getChapters(this.book)[this.currentChapter])
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.nightMode ? '#E0E0E0' : Theme.TEXT_MAIN)
            .padding({ top: 16 })

          ForEach(this.paragraphs(), (paragraph: string) => {
            Text(paragraph)
              .fontSize(this.readFontSize)
              .lineHeight(this.readFontSize * 1.8)
              .fontColor(this.nightMode ? '#B0B0B0' : '#444444')
              .width('100%')
          }, (paragraph: string, index: number) => `${index}-${paragraph}`)
        }
        .width('100%')
        .padding({ left: 20, right: 20, bottom: 24 })
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)

      Row() {
        Text('目录')
          .fontSize(14)
          .fontColor(this.nightMode ? '#B0B0B0' : Theme.TEXT_SUB)
          .padding({ left: 18, right: 18, top: 9, bottom: 9 })
          .borderRadius(16)
          .border({ width: 1, color: this.nightMode ? '#444444' : Theme.DIVIDER })
          .onClick(() => {
            this.currentChapter = -1;
          })

        Blank()

        Text('上一章')
          .fontSize(14)
          .fontColor(this.currentChapter > 0 ? Theme.PRIMARY : Theme.TEXT_SUB)
          .padding({ left: 18, right: 18, top: 9, bottom: 9 })
          .borderRadius(16)
          .border({
            width: 1,
            color: this.currentChapter > 0 ? Theme.PRIMARY : Theme.DIVIDER
          })
          .onClick(() => {
            if (this.currentChapter > 0) {
              this.currentChapter -= 1;
            }
          })

        Text('下一章')
          .fontSize(14)
          .fontColor(Theme.PRIMARY)
          .padding({ left: 18, right: 18, top: 9, bottom: 9 })
          .borderRadius(16)
          .border({ width: 1, color: Theme.PRIMARY })
          .onClick(() => {
            if (this.currentChapter < 11) {
              this.currentChapter += 1;
            }
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 8, bottom: this.bottomInset + 8 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.nightMode ? '#121212' : Theme.BG_PAGE)
  }

  paragraphs(): string[] {
    return getChapterContent(this.book, this.currentChapter).split('\n\n');
  }

  build() {
    NavDestination() {
      Column() {
        this.header()

        if (this.book.id < 0) {
          Column() {
            Text('加载中...')
              .fontSize(14)
              .fontColor(Theme.TEXT_SUB)
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
        } else {
          if (this.currentChapter < 0) {
            Scroll() {
              Column({ space: 12 }) {
                this.bookInfoCard()
                this.chapterList()
              }
              .width('100%')
              .padding(16)
              .alignItems(HorizontalAlign.Start)
            }
            .layoutWeight(1)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .align(Alignment.Top)
            .backgroundColor(Theme.BG_PAGE)
          } else {
            this.readingView()
          }
        }
      }
      .width('100%')
      .height('100%')
    }
    .hideTitleBar(true)
    .onReady((ctx: NavDestinationContext) => {
      this.pathStack = ctx.pathStack;
      const param = ctx.pathInfo.param as number | undefined;
      if (param !== undefined) {
        const book = getBookById(param);
        if (book !== undefined) {
          this.book = book;
        }
      }
    })
  }
}
