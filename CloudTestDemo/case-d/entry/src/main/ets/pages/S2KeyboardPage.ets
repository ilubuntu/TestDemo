import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct S2KeyboardPage {
  private timerId: number = -1;

  aboutToAppear(): void {
    this.timerId = setTimeout(() => {
      focusControl.requestFocus('feedbackInput');
    }, 500);
  }

  aboutToDisappear(): void {
    clearTimeout(this.timerId);
  }

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

      Text('意见反馈').fontSize(20).fontWeight(FontWeight.Bold)
        .width('100%').padding({ left: 16, top: 8, bottom: 8 })

      TextArea({ placeholder: '请详细描述您遇到的问题或建议...' })
        .key('feedbackInput')
        .height(140)
        .margin({ left: 16, right: 16, top: 16 })
        .backgroundColor('#F5F6F7').borderRadius(10)

      Text('提交后我们将在 3 个工作日内处理并回复。紧急问题请优先联系在线客服。')
        .fontSize(13).fontColor('#999999').lineHeight(20)
        .margin(16)

      Button('提交反馈')
        .width('80%').height(48).fontSize(16)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
