import { promptAction } from '@kit.ArkUI'

@Component
export struct SettingsPage {
  @Consume('navStack') pathStack: NavPathStack
  @State notifyOn: boolean = true

  @Builder
  navItem(label: string, destName: string) {
    Row() {
      Text(label)
        .fontSize(16)
        .fontColor('#222222')
      Blank()
      Text('>')
        .fontSize(18)
        .fontColor('#C8C8C8')
    }
    .width('100%')
    .height(54)
    .padding({ left: 16, right: 16 })
    .onClick(() => {
      this.pathStack.pushPathByName(destName, '')
    })
  }

  build() {
    Column() {
      Row() {
        Text('设置')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#222222')
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Color.White)
      .alignItems(VerticalAlign.Center)

      Column() {
        this.navItem('隐私信息', 'privacy')
        Divider()
          .color('#F0F0F0')
          .margin({ left: 16 })
        this.navItem('关于我们', 'about')
      }
      .width('100%')
      .borderRadius(12)
      .backgroundColor(Color.White)
      .clip(true)
      .margin({ top: 12 })

      Column() {
        Row() {
          Text('接收推送通知')
            .fontSize(16)
            .fontColor('#222222')
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: this.notifyOn })
            .onChange((isOn: boolean) => {
              this.notifyOn = isOn
            })
        }
        .width('100%')
        .height(54)
        .padding({ left: 16, right: 16 })

        Divider()
          .color('#F0F0F0')
          .margin({ left: 16 })

        Row() {
          Text('清除缓存')
            .fontSize(16)
            .fontColor('#222222')
          Blank()
          Text('12.6 MB')
            .fontSize(14)
            .fontColor('#999999')
            .margin({ right: 8 })
          Text('>')
            .fontSize(18)
            .fontColor('#C8C8C8')
        }
        .width('100%')
        .height(54)
        .padding({ left: 16, right: 16 })
        .onClick(() => {
          promptAction.showToast({ message: '缓存已清除' })
        })
      }
      .width('100%')
      .borderRadius(12)
      .backgroundColor(Color.White)
      .clip(true)
      .margin({ top: 12 })

      Blank()

      Text('资讯头条 v1.0.0')
        .fontSize(12)
        .fontColor('#BBBBBB')
        .margin({ bottom: 24 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6F8')
  }
}
