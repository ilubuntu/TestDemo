import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  private cells: Resource[] = [
    $r('app.media.flag_usd'), $r('app.media.flag_jpy'), $r('app.media.flag_eur'),
    $r('app.media.flag_gbp'), $r('app.media.flag_cny'), $r('app.media.flag_krw')
  ];

  build() {
    Scroll() {
      Column() {
        Text('环球资讯').fontSize(20).fontWeight(FontWeight.Bold)
          .width('100%').padding({ left: 16, top: 44, bottom: 8 })

        Image($r('app.media.poster1')).width('100%')

        Row({ space: 6 }) {
          ForEach(this.cells, (img: Resource) => {
            Image(img).height(20).aspectRatio(1).objectFit(ImageFit.Cover).borderRadius(2)
          }, (img: Resource, idx: number) => `g-${idx}`)
        }
        .width('100%').padding({ left: 12, right: 12, top: 10 })

        Row({ space: 12 }) {
          Button('图文详情页').layoutWeight(1).height(40).fontSize(14)
            .onClick(() => { router.pushUrl({ url: 'pages/DetailPage' }); })
          Button('半模态弹窗页').layoutWeight(1).height(40).fontSize(14)
            .onClick(() => { router.pushUrl({ url: 'pages/SheetPage' }); })
        }
        .width('100%').padding(16).margin({ top: 12 })
      }
      .width('100%').padding({ bottom: 48 })
    }
    .width('100%').height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Auto)
    .backgroundColor('#FFFFFF')
  }
}
