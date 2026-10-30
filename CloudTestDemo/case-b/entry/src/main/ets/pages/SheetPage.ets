import { window } from '@kit.ArkUI';
import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct SheetPage {
  @Local showSheet: boolean = false;
  @Local sheetHeight: number = 400;

  aboutToAppear(): void {
    const ctx = this.getUIContext().getHostContext();
    if (!ctx) {
      return;
    }
    window.getLastWindow(ctx).then((win) => {
      const ui = this.getUIContext();
      this.sheetHeight = ui.px2vp(win.getWindowProperties().windowRect.width);
    });
    setTimeout(() => {
      this.showSheet = true;
    }, 100);
  }

  @Builder
  sheetBuilder() {
    Column({ space: 14 }) {
      Image($r('app.media.icon')).width(56).height(56).borderRadius(14).objectFit(ImageFit.Contain)
      Text('环球资讯').fontSize(20).fontWeight(FontWeight.Bold)
      Text('版本 1.0.0 (100)').fontSize(13).fontColor('#999999')
      Column({ space: 12 }) {
        Text('《用户服务协议》').fontSize(14).fontColor('#007DFF')
        Text('《隐私政策》').fontSize(14).fontColor('#007DFF')
      }.margin({ top: 6 })
      Blank().layoutWeight(1)
      Button('同意并继续').width('80%').height(44).fontSize(15)
        .onClick(() => { this.showSheet = false; })
    }
    .width('100%')
    .height(this.sheetHeight)
    .padding({ top: 36, bottom: 36 })
    .backgroundColor('#FFFFFF')
    .justifyContent(FlexAlign.Center)
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
      }.width('100%').padding({ left: 12, top: 44, bottom: 12 })

      Column({ space: 12 }) {
        Text('半模态弹窗测试页').fontSize(22).fontWeight(FontWeight.Bold)
        Text('进入页面后自动弹出应用信息半模态').fontSize(14).fontColor('#999999')
      }
      .width('100%').layoutWeight(1).justifyContent(FlexAlign.Center)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
    .bindSheet(this.showSheet, this.sheetBuilder(), {
      height: this.sheetHeight,
      preferType: SheetType.BOTTOM,
      dragBar: true,
      showClose: true,
      backgroundColor: '#FFFFFF'
    })
  }
}
