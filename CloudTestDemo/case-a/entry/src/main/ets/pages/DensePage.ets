import { router } from '@kit.ArkUI';

interface SettingItem {
  title: string;
  value: string;
  color: string;
}

@Entry
@ComponentV2
struct DensePage {
  private settings: SettingItem[] = [
    { title: '账号与安全', value: '', color: '#4A6CF7' },
    { title: '消息通知', value: '已开启', color: '#2FDE5F' },
    { title: '深色模式', value: '跟随系统', color: '#E6810C' },
    { title: '字体大小', value: '标准', color: '#9C6BEF' },
    { title: '存储空间', value: '12.6 GB', color: '#EF5B8B' },
    { title: '清理缓存', value: '236 MB', color: '#5BEF8B' },
    { title: '流量使用', value: 'WiFi 优先', color: '#5B8DEF' },
    { title: '隐私与权限', value: '', color: '#F7A44A' },
    { title: '语言与地区', value: '简体中文', color: '#44C2F7' },
    { title: '辅助功能', value: '', color: '#8BEF5B' },
    { title: '检查更新', value: 'v1.0.0', color: '#DE5F2F' },
    { title: '关于应用', value: '', color: '#6B7BEF' }
  ];

  build() {
    Column() {
      Row() {
        Column() {
          Image($r('app.media.nav_left')).width(36).height(36)
        }
        .width(48).height(48)
        .justifyContent(FlexAlign.Center)
        .onClick(() => { router.back(); })
      }.width('100%').padding({ left: 8, top: 40, bottom: 4 })

      Text('设置').fontSize(20).fontWeight(FontWeight.Bold)
        .width('100%').padding({ left: 10, top: 4, bottom: 6 })

      List({ space: 0 }) {
        ForEach(this.settings, (s: SettingItem, idx: number) => {
          ListItem() {
            Row({ space: 10 }) {
              Column().width(26).height(26).borderRadius(6).backgroundColor(s.color)
              Text(s.title).fontSize(15).layoutWeight(1).fontColor('#222222')
              if (s.value.length > 0) {
                Text(s.value).fontSize(13).fontColor('#999999')
              }
              Text('>').fontSize(14).fontColor('#CCCCCC')
            }
            .width('100%')
            .padding({ left: 8, right: 8, top: 13, bottom: 13 })
            .backgroundColor(idx % 2 === 0 ? '#FFFFFF' : '#F2F4F7')
          }
        }, (s: SettingItem) => s.title)
      }
      .layoutWeight(1).width('100%').scrollBar(BarState.Off)
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
