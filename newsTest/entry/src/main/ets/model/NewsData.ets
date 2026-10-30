export interface NewsItem {
  id: number
  title: string
  summary: string
  category: string
  source: string
  publishTime: string
  image: Resource
  content: string
  hot: boolean
}

export interface BannerItem {
  newsId: number
  title: string
  image: Resource
}

const FILL_PARAS: string[] = [
  '据了解，相关方面已经成立专项工作组，后续将持续跟进事件进展，并及时向社会公布最新情况。',
  '业内人士分析认为，此次变化将对行业格局产生较为深远的影响，产业链上下游企业都需要积极应对。',
  '专家提醒，广大用户在享受新事物带来便利的同时，也要注意保护个人隐私和信息安全。',
  '更多详细内容，请持续关注本平台的后续报道。'
]

export function createEmptyNews(): NewsItem {
  return {
    id: 0,
    title: '',
    summary: '',
    category: '',
    source: '',
    publishTime: '',
    image: $r('app.media.news1'),
    content: '',
    hot: false
  }
}

export const CATEGORIES: string[] = ['推荐', '科技', '财经', '体育', '娱乐', '军事', '美食']

export const HOT_SEARCH_WORDS: string[] = ['科技', '大模型', '折叠屏', '新能源', 'A股', '国足', '春节档', '火箭', '黄金', '演唱会']

export const BANNERS: BannerItem[] = [
  {
    newsId: 1,
    title: '国产操作系统迎来重大更新，生态建设再提速',
    image: $r('app.media.banner1')
  },
  {
    newsId: 3,
    title: '新一代AI大模型发布，多模态能力显著增强',
    image: $r('app.media.banner2')
  },
  {
    newsId: 15,
    title: '运载火箭发射圆满成功，一箭多星再立新功',
    image: $r('app.media.banner3')
  }
]

function buildContent(lead: string): string {
  return [lead].concat(FILL_PARAS).join('\n')
}

export const NEWS_LIST: NewsItem[] = [
  {
    id: 1,
    title: '国产操作系统迎来重大更新，生态建设再提速',
    summary: '新版本在性能、安全和生态兼容性方面全面升级，引发行业广泛关注。',
    category: '科技',
    source: '科技日报',
    publishTime: '今天 09:30',
    image: $r('app.media.news1'),
    content: buildContent('近日，国产操作系统正式发布重大版本更新，新版本在系统流畅度、安全防护以及应用生态兼容性等方面均实现了全面升级，多家软硬件厂商宣布第一时间完成适配。'),
    hot: true
  },
  {
    id: 2,
    title: '折叠屏手机出货量创新高，供应链企业订单饱满',
    summary: '随着铰链与屏幕技术日趋成熟，折叠屏正从小众走向主流消费市场。',
    category: '科技',
    source: '科技周刊',
    publishTime: '今天 08:15',
    image: $r('app.media.news2'),
    content: buildContent('最新数据显示，本季度折叠屏手机出货量同比大幅增长，创下历史新高，多家供应链企业排产饱满。'),
    hot: false
  },
  {
    id: 3,
    title: '新一代AI大模型发布，多模态能力显著增强',
    summary: '文本、图像、语音多模态深度融合，推理成本下降超三成。',
    category: '科技',
    source: '极客观察',
    publishTime: '昨天 20:05',
    image: $r('app.media.news3'),
    content: buildContent('某头部科技企业今日正式发布新一代AI大模型，在文本、图像、语音的多模态融合理解与生成能力上显著增强，同时推理成本下降超过三成。'),
    hot: true
  },
  {
    id: 4,
    title: 'A股三大指数集体收涨，新能源板块领涨',
    summary: '市场成交额突破万亿，北向资金净流入超百亿元。',
    category: '财经',
    source: '财经网',
    publishTime: '今天 10:12',
    image: $r('app.media.news4'),
    content: buildContent('今日收盘，A股三大指数集体上涨，新能源与半导体板块表现强势，市场成交额突破一万亿元。'),
    hot: true
  },
  {
    id: 5,
    title: '黄金价格持续走高，投资者关注避险资产配置',
    summary: '国际金价连续多日上涨，创近几个月以来新高。',
    category: '财经',
    source: '第一财讯',
    publishTime: '今天 07:40',
    image: $r('app.media.news5'),
    content: buildContent('受国际局势与降息预期影响，国际黄金价格近日持续走高，避险资产配置受到投资者广泛关注。'),
    hot: false
  },
  {
    id: 6,
    title: '多家银行下调存款利率，理财市场迎来新变化',
    summary: '存款利率进入“1时代”，稳健型理财产品受到关注。',
    category: '财经',
    source: '华尔街见闻',
    publishTime: '昨天 18:22',
    image: $r('app.media.news6'),
    content: buildContent('继多家国有大行之后，多家股份制银行近日陆续下调存款挂牌利率，稳健型理财产品关注度明显上升。'),
    hot: false
  },
  {
    id: 7,
    title: '国足新一期集训名单公布，多名年轻球员入选',
    summary: '新帅上任后大胆启用新人，备战下月世预赛关键战役。',
    category: '体育',
    source: '体育周报',
    publishTime: '今天 11:05',
    image: $r('app.media.news7'),
    content: buildContent('足协今日公布国家队新一期集训名单，多名U23年轻球员首次入选，球队将于下周展开集中训练。'),
    hot: true
  },
  {
    id: 8,
    title: 'CBA常规赛：强强对话上演三加时大战',
    summary: '卫冕冠军客场险胜，两队合力轰下240+高分。',
    category: '体育',
    source: '篮球先锋',
    publishTime: '昨天 21:48',
    image: $r('app.media.news8'),
    content: buildContent('CBA常规赛昨晚上演焦点大战，两支争冠热门球队鏖战三个加时才分出胜负，为球迷奉献了一场经典对决。'),
    hot: false
  },
  {
    id: 9,
    title: '马拉松赛季开启，多地赛事报名人数创新高',
    summary: '全民健身热情高涨，热门赛事中签率不足三成。',
    category: '体育',
    source: '马拉松平台',
    publishTime: '昨天 09:12',
    image: $r('app.media.news9'),
    content: buildContent('随着天气转暖，全国多地马拉松赛事陆续开启报名，多个热门赛事报名人数创下历史新高。'),
    hot: false
  },
  {
    id: 10,
    title: '春节档电影预售票房破亿，多部大片竞争激烈',
    summary: '科幻、喜剧、动画齐发力，排片竞争进入白热化。',
    category: '娱乐',
    source: '娱乐星闻',
    publishTime: '今天 12:20',
    image: $r('app.media.news10'),
    content: buildContent('距离春节档还有一周，多部新片预售总票房已突破一亿元，题材覆盖科幻、喜剧、动画等多个类型。'),
    hot: true
  },
  {
    id: 11,
    title: '热门剧集收官，全网播放量突破百亿',
    summary: '精良制作与扎实剧本获好评，续集已提上日程。',
    category: '娱乐',
    source: '影视风向标',
    publishTime: '昨天 15:36',
    image: $r('app.media.news11'),
    content: buildContent('备受关注的年度热门剧集昨晚迎来大结局，全网播放量突破百亿，制作方宣布续集已经启动筹备。'),
    hot: false
  },
  {
    id: 12,
    title: '音乐节门票开售即售罄，演出市场持续回暖',
    summary: '今年演唱会、音乐节场次大幅增加，观众热情高涨。',
    category: '娱乐',
    source: '演出观察',
    publishTime: '昨天 13:02',
    image: $r('app.media.news12'),
    content: buildContent('某知名音乐节门票今日上午开售，几分钟内即宣告售罄，线下演出市场延续回暖态势。'),
    hot: false
  },
  {
    id: 13,
    title: '新型护卫舰正式入列，远海作战能力提升',
    summary: '新舰信息化程度更高，可执行多样化军事任务。',
    category: '军事',
    source: '环球军情',
    publishTime: '昨天 08:50',
    image: $r('app.media.news13'),
    content: buildContent('海军新型护卫舰入列仪式近日在某军港举行，该舰信息化程度更高，将进一步提升远海综合作战能力。'),
    hot: false
  },
  {
    id: 14,
    title: '国际军事比赛开幕，我军代表团再获佳绩',
    summary: '多个参赛项目打破赛会纪录，展现良好军事素养。',
    category: '军事',
    source: '国防时报',
    publishTime: '3天前',
    image: $r('app.media.news14'),
    content: buildContent('一年一度的国际军事比赛在境外某训练基地正式开幕，我军代表团在首日多个项目中取得佳绩。'),
    hot: false
  },
  {
    id: 15,
    title: '运载火箭发射圆满成功，一箭多星再立新功',
    summary: '本次任务共搭载发射多颗卫星，全部顺利进入预定轨道。',
    category: '军事',
    source: '中国航天',
    publishTime: '今天 06:30',
    image: $r('app.media.news15'),
    content: buildContent('今日清晨，我国在卫星发射中心使用新型运载火箭，以一箭多星方式成功发射多颗卫星，全部顺利进入预定轨道。'),
    hot: true
  },
  {
    id: 16,
    title: '城市美食节本周末开幕，百余种特色小吃齐聚一堂',
    summary: '各地老字号与新派餐饮同台亮相，市民可一站式品尝地道美味。',
    category: '美食',
    source: '美食风向',
    publishTime: '今天 11:30',
    image: $r('app.media.food_img'),
    content: buildContent('本市一年一度的城市美食节将于本周末在中心广场开幕，届时将有百余家商户参展，涵盖各地老字号特色小吃与新派创意餐饮，现场还将举办厨艺展示与互动体验活动。'),
    hot: true
  },
  {
    id: 17,
    title: '科技赋能智慧农业，无人机播种施肥效率翻倍',
    summary: '现代农业科技应用提速，万亩农田管理人力成本大幅下降。',
    category: '科技',
    source: '农业科技报',
    publishTime: '今天 10:45',
    image: $r('app.media.news4'),
    content: buildContent('随着智慧农业技术的普及，多地农场开始规模化使用无人机进行播种、施肥与病虫害监测，作业效率较传统方式提升一倍以上。'),
    hot: false
  },
  {
    id: 18,
    title: '量子计算原型机再创运算速度纪录，实用化进程加快',
    summary: '我国科研团队在量子科技领域取得重要进展，离实际应用更近一步。',
    category: '科技',
    source: '前沿科技报',
    publishTime: '昨天 16:20',
    image: $r('app.media.news5'),
    content: buildContent('国内科研团队近日成功研制出新一代量子计算原型机，在特定任务的运算速度上再次刷新纪录，为量子计算走向实用化奠定了基础。'),
    hot: false
  }
]

export function getNewsByCategory(category: string): NewsItem[] {
  if (category === '推荐') {
    return NEWS_LIST.filter((item: NewsItem) => item.hot)
  }
  return NEWS_LIST.filter((item: NewsItem) => item.category === category)
}

export function searchNews(keyword: string): NewsItem[] {
  const kw: string = keyword.trim()
  if (kw.length === 0) {
    return []
  }
  return NEWS_LIST.filter((item: NewsItem) => {
    return item.title.indexOf(kw) >= 0 || item.summary.indexOf(kw) >= 0 || item.category.indexOf(kw) >= 0
  })
}
