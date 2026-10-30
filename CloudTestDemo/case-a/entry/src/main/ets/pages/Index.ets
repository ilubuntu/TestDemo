import { router } from '@kit.ArkUI';
import { Currency, buildCurrencies } from '../model/Currency';

@Entry
@ComponentV2
struct Index {
  @Local currencies: Currency[] = buildCurrencies();

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        Text('汇率速查').fontSize(20).fontWeight(FontWeight.Bold)
          .width('100%').padding({ left: 16, top: 44, bottom: 4 })
        Row({ space: 8 }) {
          Button('状态栏页').fontSize(12).height(32).layoutWeight(1)
            .onClick(() => { router.pushUrl({ url: 'pages/StatusBarCutPage' }); })
          Button('挖孔页').fontSize(12).height(32).layoutWeight(1)
            .onClick(() => { router.pushUrl({ url: 'pages/CutoutPage' }); })
          Button('高留白').fontSize(12).height(32).layoutWeight(1)
            .onClick(() => { router.pushUrl({ url: 'pages/SparsePage' }); })
          Button('低留白').fontSize(12).height(32).layoutWeight(1)
            .onClick(() => { router.pushUrl({ url: 'pages/DensePage' }); })
        }.width('100%').padding({ left: 12, right: 12, bottom: 8 })

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
        .divider({ strokeWidth: 0.5, color: '#EEEEEE', startMargin: 64 })
      }
      .width('100%').height('100%').backgroundColor('#FFFFFF')
      .padding({ bottom: 132 })

      Column({ space: 8 }) {
        TextInput({ placeholder: '输入货币代码查询' })
          .height(40).backgroundColor('#3A3D45').fontColor('#FFFFFF')
          .placeholderColor('#888888').borderRadius(8)
        Button('查询').width('100%').height(56).fontSize(16)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 12, bottom: 0 })
      .backgroundColor('#2F3138')
    }
    .width('100%').height('100%')
  }
}
