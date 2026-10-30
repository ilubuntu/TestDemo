import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct BigTextPage {
  build() {
    Column() {
      Row() {
        Column() {
          Image($r('app.media.nav_left')).width(36).height(36)
        }
        .width(48).height(48)
        .justifyContent(FlexAlign.Center)
        .onClick(() => { router.back(); })
      }.width('100%').padding(12).margin({ top: 40 })

      Column({ space: 24 }) {
        Text('今日热点资讯')
          .width('60%')
          .maxLines(1)
          .minFontSize(20)
          .maxFontSize(64)
          .fontWeight(FontWeight.Bold)
          .fontColor('#222222')

        Text('全球科技大会即将开幕')
          .width('80%')
          .maxLines(1)
          .minFontSize(14)
          .maxFontSize(40)
          .fontColor('#444444')

        Image($r('app.media.icon'))
          .width('25%')
          .aspectRatio(1)
          .objectFit(ImageFit.Contain)
          .borderRadius(8)

        Text('图标与文字按屏宽百分比自适应，未控制物理尺寸上限')
          .fontSize(12).fontColor('#999999')
      }
      .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
