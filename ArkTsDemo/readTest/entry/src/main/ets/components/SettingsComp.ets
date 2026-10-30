import { Theme } from '../common/Theme';

@Component
export struct SettingsComp {
  @StorageProp('topInset') topInset: number = 0;
  @StorageLink('nightMode') nightMode: boolean = false;
  @StorageLink('wifiDownload') wifiDownload: boolean = true;
  @StorageLink('notification') notification: boolean = false;
  @StorageLink('readFontSize') readFontSize: number = 18;

  clearCache(): void {
    this.getUIContext().getPromptAction().showToast({ message: '阅读缓存已清除' });
  }

  @Builder
  groupTitle(title: string) {
    Text(title)
      .fontSize(13)
      .fontColor(Theme.TEXT_SUB)
      .padding({ left: 4, top: 8, bottom: 4 })
  }

  @Builder
  settingRow(label: string, sub: string) {
    Row() {
      Column({ space: 2 }) {
        Text(label)
          .fontSize(15)
          .fontColor(Theme.TEXT_MAIN)
        if (sub.length > 0) {
          Text(sub)
            .fontSize(12)
            .fontColor(Theme.TEXT_SUB)
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 12, bottom: 12 })
    .backgroundColor(Theme.BG_CARD)
    .borderRadius(10)
  }

  @Builder
  toggleRow(label: string, sub: string, isOn: boolean, onToggle: (value: boolean) => void) {
    Row() {
      Column({ space: 2 }) {
        Text(label)
          .fontSize(15)
          .fontColor(Theme.TEXT_MAIN)
        if (sub.length > 0) {
          Text(sub)
            .fontSize(12)
            .fontColor(Theme.TEXT_SUB)
        }
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Toggle({ type: ToggleType.Switch, isOn: isOn })
        .onChange((value: boolean) => {
          onToggle(value);
        })
    }
    .width('100%')
    .padding({ left: 16, right: 16, top: 12, bottom: 12 })
    .backgroundColor(Theme.BG_CARD)
    .borderRadius(10)
  }

  build() {
    Column() {
      // 沉浸式顶栏
      Column() {
        Text('设置')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: this.topInset + 8, bottom: 12 })
      .alignItems(HorizontalAlign.Start)
      .backgroundColor(Theme.PRIMARY)
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP])

      Scroll() {
        Column({ space: 10 }) {
          this.groupTitle('阅读设置')
          this.toggleRow('夜间模式', '阅读页使用深色背景', this.nightMode,
            (value: boolean) => {
              this.nightMode = value;
            })
          Row() {
            Column({ space: 2 }) {
              Text('正文字号')
                .fontSize(15)
                .fontColor(Theme.TEXT_MAIN)
              Text('调整阅读页正文大小，当前设置全局生效')
                .fontSize(12)
                .fontColor(Theme.TEXT_SUB)
            }
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)

            Text(`${this.readFontSize}fp`)
              .fontSize(14)
              .fontColor(Theme.PRIMARY)
              .width(44)
              .textAlign(TextAlign.End)
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 12, bottom: 8 })
          .backgroundColor(Theme.BG_CARD)
          .borderRadius(10)

          Slider({ value: this.readFontSize, min: 14, max: 28, step: 1, style: SliderStyle.OutSet })
            .width('100%')
            .blockColor(Theme.PRIMARY)
            .selectedColor(Theme.PRIMARY)
            .trackColor('#F0F0F0')
            .padding({ left: 16, right: 16 })
            .backgroundColor(Theme.BG_CARD)
            .borderRadius(10)
            .onChange((value: number) => {
              this.readFontSize = Math.round(value);
            })

          this.groupTitle('通用设置')
          this.toggleRow('仅 Wi-Fi 下载', '移动网络下不下载书籍内容', this.wifiDownload,
            (value: boolean) => {
              this.wifiDownload = value;
            })
          this.toggleRow('消息通知', '接收更新与推荐提醒', this.notification,
            (value: boolean) => {
              this.notification = value;
            })
          Text('清除阅读缓存')
            .fontSize(14)
            .fontColor(Theme.PRIMARY)
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding(12)
            .backgroundColor(Theme.BG_CARD)
            .borderRadius(10)
            .onClick(() => {
              this.clearCache();
            })

          this.groupTitle('关于')
          this.settingRow('版本', 'readTest 1.0.0')
          this.settingRow('用户协议', '')
          this.settingRow('隐私政策', '')
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
        .alignItems(HorizontalAlign.Start)
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .align(Alignment.Top)
    }
    .width('100%')
    .height('100%')
  }
}
