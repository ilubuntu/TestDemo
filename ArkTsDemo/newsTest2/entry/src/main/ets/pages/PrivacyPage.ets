@Component
export struct PrivacyPage {
  @Consume('navStack') pathStack: NavPathStack

  private sections: string[] = [
    '我们深知个人信息对你的重要性，将会尽全力保护你的个人信息安全可靠。本政策旨在说明我们如何收集、使用和存储你的相关信息。',
    '一、信息收集\n在为你提供新闻浏览与搜索服务的过程中，我们可能会收集设备标识、网络状态与浏览偏好等必要信息，用于保障服务的正常运行。',
    '二、信息使用\n收集的信息仅用于内容展示、搜索优化与产品体验改进。未经你的同意，我们不会将你的个人信息提供给任何第三方。',
    '三、信息安全\n我们采用业界通行的安全技术与管理措施保护你的信息，防止信息被泄露、篡改或丢失。',
    '四、权限管理\n你可以随时在系统的设置中管理应用的网络、通知等权限。权限关闭后，相关功能可能无法正常使用。',
    '五、政策更新\n我们可能会适时修订本政策，修订后的内容将通过应用内公告等方式及时告知你。'
  ]

  build() {
    NavDestination() {
      Scroll() {
        Column() {
          ForEach(this.sections, (section: string, index: number) => {
            Text(section)
              .fontSize(15)
              .fontColor('#444444')
              .lineHeight(26)
              .width('100%')
              .margin({ top: index === 0 ? 0 : 16 })
          }, (section: string) => section)
        }
        .alignItems(HorizontalAlign.Start)
        .padding(16)
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .title('隐私信息')
    .backgroundColor(Color.White)
  }
}
