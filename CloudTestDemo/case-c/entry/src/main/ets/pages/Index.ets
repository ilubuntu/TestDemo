import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct Index {
  build() {
    Column({ space: 16 }) {
      Text('云测用例C·形态切换')
        .fontSize(20).fontWeight(FontWeight.Bold)
        .width('100%').padding({ left: 16, top: 52, bottom: 12 })

      Button('布局截断页').width('80%').height(44).fontSize(15)
        .onClick(() => { router.pushUrl({ url: 'pages/BrokenLayoutPage' }); })
      Button('状态丢失页').width('80%').height(44).fontSize(15)
        .onClick(() => { router.pushUrl({ url: 'pages/StateLossPage' }); })
      Button('大字号页').width('80%').height(44).fontSize(15)
        .onClick(() => { router.pushUrl({ url: 'pages/BigTextPage' }); })

      Text('请在折叠屏设备上折叠/展开后观察各页面表现')
        .fontSize(13).fontColor('#999999').margin({ top: 24 })
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
