import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct DetailPage {
  build() {
    Column() {
      Row() {
        Column() {
          Image($r('app.media.nav_left')).width(36).height(36)
        }
        .width(48).height(48)
        .justifyContent(FlexAlign.Center)
        .onClick(() => { router.back(); })
      }.width('100%').padding({ left: 12, top: 44, bottom: 12 })

      Image($r('app.media.poster4'))
        .width('100%').height('70%')
        .objectFit(ImageFit.Cover)

      Column({ space: 8 }) {
        Text('年度视觉设计趋势报告发布').fontSize(20).fontWeight(FontWeight.Bold)
        Text('报告汇总了本年度最具代表性的视觉语言与版式方向，从色彩、字体到布局节奏全面梳理，为下一阶段的设计工作提供参考。')
          .fontSize(14).fontColor('#666666').lineHeight(22)
      }
      .width('100%').padding(16).alignItems(HorizontalAlign.Start)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
