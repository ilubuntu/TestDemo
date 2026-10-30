import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SparsePage {
  build() {
    Stack() {
      Column() {
        Row() {
          Column() {
            Image($r('app.media.nav_left')).width(36).height(36)
          }
          .width(48).height(48)
          .justifyContent(FlexAlign.Center)
          .onClick(() => { router.back(); })
        }.width('100%').padding(12).margin({ top: 40 })
      }.width('100%').height('100%').alignItems(HorizontalAlign.Start)

      Column({ space: 10 }) {
        Image($r('app.media.icon')).width(40).height(40).objectFit(ImageFit.Contain)
        Text('暂无数据').fontSize(14).fontColor('#999999')
      }
      .padding(20)
      .backgroundColor('#FAFAFA').borderRadius(12)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
