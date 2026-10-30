import { logout, switchTab } from '../model/ShopStore'
import { promptAction } from '@kit.ArkUI'

@Component
export struct MinePage {
  @Consume('navStack') pathStack: NavPathStack
  @StorageLink('isLogin') isLogin: boolean = false
  @StorageLink('userName') userName: string = ''
  @StorageLink('favIds') favIds: number[] = []
  @StorageLink('historyIds') historyIds: number[] = []

  @Builder
  orderIconItem(bgColor: string, char: string, label: string) {
    Column({ space: 6 }) {
      Column() {
        Text(char)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
      }
      .width(42)
      .height(42)
      .borderRadius(21)
      .backgroundColor(bgColor)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      Text(label)
        .fontSize(11)
        .fontColor('#555555')
    }
    .layoutWeight(1)
    .onClick(() => {
      this.pathStack.pushPathByName('orders', '')
    })
  }

  @Builder
  menuItem(label: string, extra: string, destName: string) {
    Row() {
      Text(label)
        .fontSize(15)
        .fontColor('#222222')
      Text(extra)
        .fontSize(12)
        .fontColor('#999999')
        .margin({ left: 8 })
      Blank()
      Text('>')
        .fontSize(16)
        .fontColor('#C8C8C8')
    }
    .width('100%')
    .height(52)
    .padding({ left: 16, right: 16 })
    .onClick(() => {
      if (destName.length > 0) {
        this.pathStack.pushPathByName(destName, '')
      } else {
        promptAction.showToast({ message: '功能开发中，敬请期待' })
      }
    })
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Row({ space: 14 }) {
            Column() {
              Text(this.isLogin && this.userName.length > 0 ? this.userName.substring(0, 1) : '客')
                .fontSize(26)
                .fontWeight(FontWeight.Bold)
                .fontColor('#FF6B35')
            }
            .width(64)
            .height(64)
            .borderRadius(32)
            .backgroundColor(Color.White)
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)

            Column({ space: 6 }) {
              Text(this.isLogin && this.userName.length > 0 ? this.userName : '点击登录')
                .fontSize(19)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)
              Text(this.isLogin ? '黄金会员 · 积分 2680' : '登录后享受更多会员权益')
                .fontSize(12)
                .fontColor('#FFE3D1')
            }
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)

            Text('>')
              .fontSize(20)
              .fontColor(Color.White)
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 30, bottom: 26 })
          .alignItems(VerticalAlign.Center)
          .linearGradient({
            angle: 135,
            colors: [['#FF8C42', 0.0], ['#FF6B35', 1.0]]
          })
          .onClick(() => {
            if (!this.isLogin) {
              this.pathStack.pushPathByName('login', '')
            }
          })

          Column() {
            Row() {
              Text('我的订单')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor('#222222')
              Blank()
              Text('全部订单 >')
                .fontSize(12)
                .fontColor('#999999')
                .onClick(() => {
                  this.pathStack.pushPathByName('orders', '')
                })
            }
            .width('100%')

            Row() {
              this.orderIconItem('#FF6B35', '付', '待付款')
              this.orderIconItem('#5F9BFF', '收', '待收货')
              this.orderIconItem('#00B894', '评', '待评价')
              this.orderIconItem('#FDCB6E', '退', '退换售后')
            }
            .width('100%')
            .margin({ top: 14 })
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)
          .margin({ top: 12, left: 12, right: 12 })

          Column() {
            this.menuItem('我的收藏', `(${this.favIds.length}件)`, 'favorites')
            Divider()
              .color('#F0F0F0')
              .margin({ left: 16 })
            this.menuItem('浏览记录', `(${this.historyIds.length}件)`, 'history')
            Divider()
              .color('#F0F0F0')
              .margin({ left: 16 })
            this.menuItem('收货地址', '', '')
            Divider()
              .color('#F0F0F0')
              .margin({ left: 16 })
            this.menuItem('联系客服', '', '')
            Divider()
              .color('#F0F0F0')
              .margin({ left: 16 })
            this.menuItem('设置', '', '')
          }
          .width('100%')
          .borderRadius(12)
          .backgroundColor(Color.White)
          .clip(true)
          .margin({ top: 12, left: 12, right: 12 })

          if (this.isLogin) {
            Text('退出登录')
              .fontSize(15)
              .fontColor('#FF4D2A')
              .width('100%')
              .height(48)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.White)
              .borderRadius(12)
              .margin({ top: 12, left: 12, right: 12 })
              .onClick(() => {
                logout()
                promptAction.showToast({ message: '已退出登录' })
              })
          }

          Text('优选商城 v1.0.0')
            .fontSize(12)
            .fontColor('#BBBBBB')
            .margin({ top: 20, bottom: 16 })
        }
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F6F8')
  }
}
