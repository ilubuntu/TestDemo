import { router, mediaquery } from '@kit.ArkUI';

interface SettingDef {
  title: string;
  color: string;
}

@ComponentV2
struct SettingToggle {
  @Param title: string = '';
  @Param color: string = '#4A6CF7';
  @Local isOn: boolean = false;

  build() {
    Row({ space: 10 }) {
      Column().width(24).height(24).borderRadius(6).backgroundColor(this.color)
      Text(this.title).fontSize(15).layoutWeight(1).fontColor('#222222')
      Toggle({ type: ToggleType.Switch, isOn: this.isOn })
        .onChange((isOn: boolean) => {
          this.isOn = isOn;
        })
    }
    .width('100%')
    .padding({ left: 12, right: 12, top: 12, bottom: 12 })
    .backgroundColor('#FFFFFF')
  }
}

@Entry
@ComponentV2
struct StateLossPage {
  @Local isWide: boolean = false;
  private settings: SettingDef[] = [
    { title: '消息通知', color: '#4A6CF7' },
    { title: '深色模式', color: '#2F3138' },
    { title: '自动播放视频', color: '#EF5B8B' },
    { title: '省流量模式', color: '#5BEF8B' },
    { title: '横屏锁定', color: '#E6810C' },
    { title: '手势导航', color: '#9C6BEF' },
    { title: '自动更新', color: '#2FDE5F' },
    { title: '云同步', color: '#5B8DEF' },
    { title: '指纹解锁', color: '#F7A44A' },
    { title: '悬浮窗', color: '#44C2F7' },
    { title: '夜间护眼', color: '#8BEF5B' },
    { title: '振动反馈', color: '#DE5F2F' },
    { title: '蓝牙', color: '#6B7BEF' },
    { title: '位置信息', color: '#EF8B5B' },
    { title: '勿扰模式', color: '#6BEFC2' },
    { title: '智能推荐', color: '#C26BEF' },
    { title: '高清画质', color: '#EF5B5B' },
    { title: '自动缓存', color: '#5BDEF0' },
    { title: '桌面快捷方式', color: '#A2EF5B' },
    { title: '实验室功能', color: '#EFDA5B' }
  ];
  private mediaQueryListener?: mediaquery.MediaQueryListener;

  aboutToAppear(): void {
    this.mediaQueryListener = mediaquery.matchMediaSync('(min-width: 600vp)');
    this.isWide = this.mediaQueryListener.matches;
    this.mediaQueryListener.on('change', (result: mediaquery.MediaQueryResult) => {
      this.isWide = result.matches;
    });
  }

  aboutToDisappear(): void {
    this.mediaQueryListener?.off('change');
  }

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

      Text('通用设置').fontSize(20).fontWeight(FontWeight.Bold)
        .width('100%').padding({ left: 16, top: 4, bottom: 8 })

      if (this.isWide) {
        List({ space: 0 }) {
          ForEach(this.settings, (s: SettingDef) => {
            ListItem() {
              SettingToggle({ title: s.title, color: s.color })
            }
          }, (s: SettingDef) => s.title)
        }
        .layoutWeight(1).width('100%')
        .lanes(2) // 展开态双列
        .scrollBar(BarState.Off)
      } else {
        List({ space: 0 }) {
          ForEach(this.settings, (s: SettingDef) => {
            ListItem() {
              SettingToggle({ title: s.title, color: s.color })
            }
          }, (s: SettingDef) => s.title)
        }
        .layoutWeight(1).width('100%')
        .scrollBar(BarState.Off)
      }
    }
    .width('100%').height('100%').backgroundColor('#FFFFFF')
  }
}
