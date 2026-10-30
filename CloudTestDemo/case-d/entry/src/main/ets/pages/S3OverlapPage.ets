import { router } from '@kit.ArkUI';

@ComponentV2
struct ServiceCard {
  @Param icon: Resource = $r('app.media.icon');
  @Param title: string = '';
  @Param desc: string = '';

  build() {
    Column({ space: 8 }) {
      Image(this.icon).width(80).height(90).objectFit(ImageFit.Cover).borderRadius(10)
      Text(this.title).fontSize(15).fontWeight(FontWeight.Medium)
      Text(this.desc).fontSize(11).fontColor('#999999')
    }
    .width('46%')
    .padding(12)
    .backgroundColor('#F7F8FA').borderRadius(12)
  }
}

@Entry
@ComponentV2
struct S3OverlapPage {
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

      Text('服务中心').fontSize(20).fontWeight(FontWeight.Bold)
        .width('100%').padding({ left: 16, top: 4, bottom: 8 })

      Column() {
        Row() {
          ServiceCard({ icon: $r('app.media.flag_usd'), title: '话费充值', desc: '满100减5' })
          ServiceCard({ icon: $r('app.media.flag_jpy'), title: '流量购买', desc: '9折起' })
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)

        Row() {
          ServiceCard({ icon: $r('app.media.flag_eur'), title: '水电缴费', desc: '实时到账' })
          ServiceCard({ icon: $r('app.media.flag_gbp'), title: '燃气代缴', desc: '一键办理' })
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)

        Row() {
          ServiceCard({ icon: $r('app.media.flag_cny'), title: '火车票务', desc: '抢票提醒' })
          ServiceCard({ icon: $r('app.media.flag_usd'), title: '酒店预订', desc: '会员立减' })
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
      .height('50%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row({ space: 10 }) {
        Text('📣').fontSize(20)
        Column({ space: 2 }) {
          Text('系统公告').fontSize(14).fontWeight(FontWeight.Medium)
          Text('本周五 00:00-06:00 部分服务暂停维护').fontSize(12).fontColor('#999999')
        }.alignItems(HorizontalAlign.Start).layoutWeight(1)
      }
      .width('100%')
      .padding(14)
      .margin({ left: 16, right: 16, top: 12 })
      .backgroundColor('#FFF7E6').borderRadius(10)

      Row({ space: 12 }) {
        Image($r('app.media.poster1')).width(56).height(56).borderRadius(10).objectFit(ImageFit.Cover)
        Column({ space: 4 }) {
          Text('新用户专享礼包').fontSize(15).fontWeight(FontWeight.Medium)
          Text('开通会员立减 20 元，限时领取').fontSize(12).fontColor('#999999')
        }.alignItems(HorizontalAlign.Start).layoutWeight(1)
        Text('领取').fontSize(13).fontColor('#FFFFFF')
          .padding({ left: 14, right: 14, top: 6, bottom: 6 })
          .backgroundColor('#E54545').borderRadius(14)
      }
      .width('100%')
      .padding(14)
      .margin({ left: 16, right: 16, top: 12 })
      .backgroundColor('#F7F8FA').borderRadius(10)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
