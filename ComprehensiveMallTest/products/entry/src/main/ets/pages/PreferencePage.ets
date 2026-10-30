import { TitleBar, iData, Style } from 'lib_foundation';

const PREFERENCE_OPTIONS: string[] = ['男', '女', '全部'];

@ComponentV2
export struct PreferencePage {

  public build(): void {
    NavDestination() {
      Column() {
        TitleBar({
          barExpandSafeArea: true,
          barColor: '#FFF1F3F5',
        }) {
          Text('偏好设置')
            .fontSize(18)
            .fontColor(Style.FONT_COLOR_LEVEL1)
            .fontWeight(500)
        }
        Scroll() {
          Column() {
            ForEach(PREFERENCE_OPTIONS, (option: string) => {
              this.buildPreferenceOption(option);
            }, (option: string) => option)
          }
          .width('100%')
          .constraintSize({ minHeight: '100%' })
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Start)
          .padding({ left: 16, right: 16 })
        }
        .layoutWeight(1)
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
      .expandSafeArea([SafeAreaType.SYSTEM, SafeAreaType.CUTOUT], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
      .backgroundColor('#FFF1F3F5')
    }
    .hideTitleBar(true)
  }

  @Builder
  private buildPreferenceOption(option: string): void {
    Row() {
      Text(option)
        .fontSize(16)
        .fontColor(Style.FONT_COLOR_LEVEL1)
      Blank()
      if (iData.local.preference === option) {
        Text('当前偏好')
          .fontSize(12)
          .fontColor(Style.THEME_COLOR)
          .margin({ right: 8 })
      }
      Radio({ value: option, group: 'preference' })
        .radioStyle({ checkedBackgroundColor: Style.THEME_COLOR })
        .checked(iData.local.preference === option)
        .onChange((checked: boolean) => {
          if (checked) {
            iData.local.preference = option;
          }
        })
    }
    .width('100%')
    .height(60)
    .borderRadius(16)
    .padding({ left: 18, right: 18 })
    .margin({ top: 12 })
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.White)
    .onClick(() => {
      iData.local.preference = option;
    })
  }
}

@Builder
export function buildPreferencePage(): void {
  PreferencePage();
}
