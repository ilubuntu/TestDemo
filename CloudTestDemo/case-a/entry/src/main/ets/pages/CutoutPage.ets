import { router } from '@kit.ArkUI';
import { Currency, buildCurrencies } from '../model/Currency';

@Entry
@ComponentV2
struct CutoutPage {
  @Local currencies: Currency[] = buildCurrencies();

  build() {
    Column() {
      Row({ space: 6 }) {
        Text('⌕').fontSize(16).fontColor('#999999')
        Text('搜索货币 / 国家').fontSize(14).fontColor('#AAAAAA')
      }
      .justifyContent(FlexAlign.Center)
      .width('92%').height(44)
      .backgroundColor('#FFFFFF').borderRadius(22)
      .margin({ top: 0 })

      Row() {
        Column() {
          Image($r('app.media.nav_left')).width(36).height(36)
        }
        .width(48).height(48)
        .justifyContent(FlexAlign.Center)
        .onClick(() => { router.back(); })
      }.width('100%').padding(12).margin({ top: 24 })

      List({ space: 0 }) {
        ForEach(this.currencies, (c: Currency) => {
          ListItem() {
            Row({ space: 12 }) {
              Image(c.flag).width(36).height(36).borderRadius(18).objectFit(ImageFit.Cover)
              Column() {
                Text(c.code).fontSize(15).fontWeight(FontWeight.Medium)
                Text(c.name).fontSize(12).fontColor('#999999')
              }.alignItems(HorizontalAlign.Start).layoutWeight(1)
              Text(c.rate).fontSize(16).fontColor('#333333')
            }.width('100%').padding({ left: 16, right: 16, top: 10, bottom: 10 })
          }
        }, (c: Currency) => c.code + c.name)
      }
      .layoutWeight(1).width('100%').scrollBar(BarState.Off)
    }
    .width('100%').height('100%').backgroundColor('#F5F6F8')
  }
}
