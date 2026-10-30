import { router } from '@kit.ArkUI';

@Entry
@ComponentV2
struct S3OverlapPage {
  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column() {
      Column({ space: 8 }) {
        Image($r('app.media.icon')).width(96).height(96).borderRadius(48).objectFit(ImageFit.Cover)
        Text('旅行摄影师小北').fontSize(20).fontWeight(FontWeight.Bold)
        Text('坐标深圳 · 常驻风光与人文摄影').fontSize(13).fontColor('#999999')
      }
      .width('100%')
      .height('24%')
      .justifyContent(FlexAlign.Center)

      Row() {
        Column({ space: 4 }) {
          Text('1,286').fontSize(18).fontWeight(FontWeight.Bold)
          Text('获赞').fontSize(12).fontColor('#999999')
        }.layoutWeight(1)
        Column({ space: 4 }) {
          Text('302').fontSize(18).fontWeight(FontWeight.Bold)
          Text('关注').fontSize(12).fontColor('#999999')
        }.layoutWeight(1)
        Column({ space: 4 }) {
          Text('8,415').fontSize(18).fontWeight(FontWeight.Bold)
          Text('粉丝').fontSize(12).fontColor('#999999')
        }.layoutWeight(1)
      }
      .width('100%')
      .height('10%')
      .justifyContent(FlexAlign.Center)

      Column({ space: 14 }) {
        Row({ space: 12 }) {
          Column({ space: 6 }) {
            Image($r('app.media.flag_usd')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('我的作品').fontSize(13)
          }.layoutWeight(1)
          Column({ space: 6 }) {
            Image($r('app.media.flag_jpy')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('收藏夹').fontSize(13)
          }.layoutWeight(1)
          Column({ space: 6 }) {
            Image($r('app.media.flag_eur')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('草稿箱').fontSize(13)
          }.layoutWeight(1)
          Column({ space: 6 }) {
            Image($r('app.media.flag_gbp')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('设置').fontSize(13)
          }.layoutWeight(1)
        }
        .width('100%')
        Row({ space: 12 }) {
          Column({ space: 6 }) {
            Image($r('app.media.flag_cny')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('数据看板').fontSize(13)
          }.layoutWeight(1)
          Column({ space: 6 }) {
            Image($r('app.media.flag_usd')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('创作中心').fontSize(13)
          }.layoutWeight(1)
          Column({ space: 6 }) {
            Image($r('app.media.flag_jpy')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('消息通知').fontSize(13)
          }.layoutWeight(1)
          Column({ space: 6 }) {
            Image($r('app.media.flag_eur')).width(48).height(48).borderRadius(12).objectFit(ImageFit.Cover)
            Text('帮助反馈').fontSize(13)
          }.layoutWeight(1)
        }
        .width('100%')
      }
      .width('100%')
      .height('34%')
      .justifyContent(FlexAlign.Center)
      .padding({ left: 16, right: 16 })

      Column({ space: 12 }) {
        Row({ space: 12 }) {
          Image($r('app.media.poster1')).width(72).height(72).borderRadius(10).objectFit(ImageFit.Cover)
          Column({ space: 6 }) {
            Text('城市夜景拍摄完全指南').fontSize(15).fontWeight(FontWeight.Medium)
            Text('从机位选择到后期调色的完整思路').fontSize(12).fontColor('#999999')
          }.alignItems(HorizontalAlign.Start).layoutWeight(1)
        }.width('100%')
        Row({ space: 12 }) {
          Image($r('app.media.poster2')).width(72).height(72).borderRadius(10).objectFit(ImageFit.Cover)
          Column({ space: 6 }) {
            Text('风光摄影后期工作流').fontSize(15).fontWeight(FontWeight.Medium)
            Text('Lightroom 与 Photoshop 的配合技巧').fontSize(12).fontColor('#999999')
          }.alignItems(HorizontalAlign.Start).layoutWeight(1)
        }.width('100%')
        Row({ space: 12 }) {
          Image($r('app.media.poster1')).width(72).height(72).borderRadius(10).objectFit(ImageFit.Cover)
          Column({ space: 6 }) {
            Text('人像布光基础十讲').fontSize(15).fontWeight(FontWeight.Medium)
            Text('自然光与闪光灯的混合运用').fontSize(12).fontColor('#999999')
          }.alignItems(HorizontalAlign.Start).layoutWeight(1)
        }.width('100%')
      }
      .width('100%')
      .height('28%')
      .justifyContent(FlexAlign.Center)
      .padding({ left: 16, right: 16 })
    }
      .width('100%').height('100%').backgroundColor('#FFFFFF').padding({ top: 36 })

      Column() {
        Image($r('app.media.nav_left')).width(36).height(36)
      }
      .width(48).height(48)
      .justifyContent(FlexAlign.Center)
      .position({ x: 4, y: 40 })
      .onClick(() => { router.back(); })
    }
    .width('100%').height('100%')
  }
}
