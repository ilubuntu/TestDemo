import { router } from '@kit.ArkUI';
import { Currency, buildCurrencies } from '../model/Currency';

@Entry
@ComponentV2
struct StatusBarCutPage {
  @Local currencies: Currency[] = buildCurrencies();

  build() {
    Column() {
      Stack() {
        Image($r('app.media.poster2')).width('100%').height(280).objectFit(ImageFit.Cover)
        Column().width('100%').height(280).backgroundColor('rgba(12,22,54,0.85)')
        Column({ space: 8 }) {
          Text('全球汇率资讯').fontSize(26).fontWeight(FontWeight.Bold).fontColor('#FFFFFF')
          Text('今日主流货币汇率走势与要闻').fontSize(14).fontColor('#C9D3F0')
        }.alignItems(HorizontalAlign.Start).padding({ left: 20, bottom: 20 })
      }.width('100%').height(280).alignContent(Alignment.BottomStart)

      Row() {
        Column() {
          Image($r('app.media.nav_left')).width(36).height(36)
        }
        .width(48).height(48)
        .justifyContent(FlexAlign.Center)
        .onClick(() => { router.back(); })
      }.width('100%').padding(12)

      List({ space: 0 }) {
        ForEach(this.currencies, (c: Currency) => {
          ListItem() {
            Row({ space: 12 }) {
              Image(c.flag).width(32).height(32).borderRadius(16).objectFit(ImageFit.Cover)
              Text(`${c.name} ${c.code}`).fontSize(15).layoutWeight(1)
              Text(c.rate).fontSize(15).fontColor('#333333')
            }.width('100%').padding({ left: 16, right: 16, top: 12, bottom: 12 })
          }
        }, (c: Currency) => c.code + c.rate)
      }
      .layoutWeight(1).width('100%').scrollBar(BarState.Off)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
