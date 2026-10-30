import { router } from '@kit.ArkUI';

interface Card {
  flag: Resource;
  code: string;
  name: string;
  rate: string;
}

@Entry
@ComponentV2
struct BrokenLayoutPage {
  private cards: Card[] = [
    { flag: $r('app.media.flag_usd_l'), code: 'USD', name: '美元', rate: '7.21' },
    { flag: $r('app.media.flag_jpy_l'), code: 'JPY', name: '日元', rate: '0.048' },
    { flag: $r('app.media.flag_eur_l'), code: 'EUR', name: '欧元', rate: '7.83' }
  ];

  build() {
    Stack() {
      Column() {
        Row() {
          Column() {
            Image($r('app.media.nav_left')).width(36).height(36)
          }
          .width(48).height(48)
          .justifyContent(FlexAlign.Center)
          .onClick(() => { router.back(); })
        }.width('100%').padding(12).margin({ top: 40 })

        Row() {
          ForEach(this.cards, (c: Card, idx: number) => {
            Column({ space: 8 }) {
              Image(c.flag).width(280).height(160).objectFit(ImageFit.Cover).borderRadius(8)
              Row() {
                Text(`${c.code} ${c.name}`).fontSize(16).fontWeight(FontWeight.Medium).layoutWeight(1)
                Text(c.rate).fontSize(16).fontColor('#E6810C')
              }.width('100%')
            }
            .width(312).padding(12)
            .backgroundColor('#F7F8FA').borderRadius(12)
          }, (c: Card, idx: number) => `card-${idx}`)
        }
        .width('100%').margin({ top: 16 })
      }.width('100%').height('100%')

      Text('HOT')
        .fontSize(12).fontColor('#FFFFFF')
        .backgroundColor('#E54545')
        .padding({ left: 8, right: 8, top: 3, bottom: 3 })
        .borderRadius(8)
        .position({ x: 330, y: 210 })
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
