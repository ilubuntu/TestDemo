import { login } from '../model/ShopStore'
import { promptAction } from '@kit.ArkUI'

@Component
export struct LoginPage {
  @Consume('navStack') pathStack: NavPathStack
  @StorageLink('isLogin') isLogin: boolean = false
  @State agreed: boolean = false
  @State logging: boolean = false

  doLogin(): void {
    if (this.logging) {
      return
    }
    if (!this.agreed) {
      promptAction.showToast({ message: '请先勾选并同意用户协议' })
      return
    }
    this.logging = true
    setTimeout(() => {
      login()
      this.logging = false
      promptAction.showToast({ message: '登录成功' })
      this.pathStack.pop()
    }, 800)
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Text('<')
            .fontSize(24)
            .fontColor('#222222')
            .width(40)
            .height(40)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.pathStack.pop()
            })
        }
        .width('100%')
        .padding({ left: 6, top: 4 })

        Column({ space: 10 }) {
          Column() {
            Text('优')
              .fontSize(38)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
          }
          .width(88)
          .height(88)
          .borderRadius(24)
          .backgroundColor('#FF6B35')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)

          Text('优选商城')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#222222')
          Text('好物优选 · 品质保障')
            .fontSize(13)
            .fontColor('#999999')
        }
        .width('100%')
        .margin({ top: 70 })
        .alignItems(HorizontalAlign.Center)

        Text(this.logging ? '登录中...' : '一键登录')
          .fontSize(17)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
          .width('80%')
          .height(48)
          .borderRadius(24)
          .backgroundColor(this.logging ? '#FFB08A' : '#FF6B35')
          .textAlign(TextAlign.Center)
          .margin({ top: 70 })
          .onClick(() => {
            this.doLogin()
          })

        Text('其他登录方式（手机号 / 邮箱）')
          .fontSize(13)
          .fontColor('#999999')
          .margin({ top: 16 })
          .onClick(() => {
            promptAction.showToast({ message: '演示工程，仅支持一键登录' })
          })

        Blank()

        Row({ space: 8 }) {
          Checkbox()
            .width(16)
            .height(16)
            .selectedColor('#FF6B35')
            .select(this.agreed)
            .onChange((value: boolean) => {
              this.agreed = value
            })
          Text('我已阅读并同意')
            .fontSize(12)
            .fontColor('#999999')
          Text('《用户协议》')
            .fontSize(12)
            .fontColor('#FF6B35')
          Text('和')
            .fontSize(12)
            .fontColor('#999999')
          Text('《隐私政策》')
            .fontSize(12)
            .fontColor('#FF6B35')
        }
        .alignItems(VerticalAlign.Center)
        .margin({ bottom: 30 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.White)
    }
    .hideTitleBar(true)
    .backgroundColor(Color.White)
  }
}
