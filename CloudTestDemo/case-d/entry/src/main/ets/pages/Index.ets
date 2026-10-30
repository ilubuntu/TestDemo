import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  build() {
    Column({ space: 16 }) {
      Text('云测用例D·一多典型问题')
        .fontSize(20).fontWeight(FontWeight.Bold)
        .width('100%').padding({ left: 16, top: 52, bottom: 12 })

      Button('场景一 截断与不可见').width('80%').height(44).fontSize(15)
        .onClick(() => { router.pushUrl({ url: 'pages/S1TruncatePage' }); })
      Button('场景二 键盘遮挡').width('80%').height(44).fontSize(15)
        .onClick(() => { router.pushUrl({ url: 'pages/S2KeyboardPage' }); })
      Button('场景三 组件重叠').width('80%').height(44).fontSize(15)
        .onClick(() => { router.pushUrl({ url: 'pages/S3OverlapPage' }); })

      Text('直板机各页正常，Pura X Max 展开态出现问题')
        .fontSize(13).fontColor('#999999').margin({ top: 24 })
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
