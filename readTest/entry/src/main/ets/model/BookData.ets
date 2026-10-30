export interface BookInfo {
  id: number;
  title: string;
  author: string;
  category: string;
  coverColor: string;
  intro: string;
}

/** 书城分类列表，第一项“全部”表示不过滤 */
export const CATEGORY_LIST: string[] = ['全部', '玄幻', '都市', '科幻', '历史', '悬疑'];

/** 书架数据在 AppStorage 中的键，值为收藏书籍的 id 数组 */
export const SHELF_KEY: string = 'shelfBookIds';

/** 书城全部书籍（测试数据） */
const RAW_BOOKS: BookInfo[] = [
  { id: 1, title: '山川问剑', author: '林远舟', category: '玄幻', coverColor: '#5B7FFF',
    intro: '少年负剑出山，一路问遍名山大川，只为寻回师父留下的最后一个答案。' },
  { id: 2, title: '九州雾语', author: '苏砚', category: '玄幻', coverColor: '#8E6BFF',
    intro: '九州大雾三百年，雾里藏着旧王朝的全部秘密，也藏着一个说书人的身世。' },
  { id: 3, title: '北城旧事', author: '沈知秋', category: '都市', coverColor: '#2FBF8F',
    intro: '胡同口的早点铺开了三十年，拆迁通知贴出来的那个早晨，故事重新开始。' },
  { id: 4, title: '深夜书店', author: '顾一灯', category: '都市', coverColor: '#FF9F43',
    intro: '只在午夜营业的书店，每位客人都能找到一本写着自己名字的书。' },
  { id: 5, title: '环形废墟纪元', author: '陈默', category: '科幻', coverColor: '#00B8D9',
    intro: '当地球变成一座环形废墟，最后的档案员开始为文明编写结案陈词。' },
  { id: 6, title: '量子回声', author: '白鹿', category: '科幻', coverColor: '#6C5CE7',
    intro: '粒子对撞机传回的数据里，出现了一段来自四十年后的求救信号。' },
  { id: 7, title: '长安十二时灯', author: '温故', category: '历史', coverColor: '#C0392B',
    intro: '上元灯会前夜，长安城内十二盏花灯接连熄灭，熄一盏便失一人。' },
  { id: 8, title: '大漠孤烟录', author: '霍去疾', category: '历史', coverColor: '#B7791F',
    intro: '戍边小卒的军中日记，记下了史官不曾写下的大漠十年。' },
  { id: 9, title: '雾中来信', author: '江晚', category: '悬疑', coverColor: '#37474F',
    intro: '每年清明收到的匿名信，信里精确预言了收信人第二天的死亡。' },
  { id: 10, title: '第七个证人', author: '裴照', category: '悬疑', coverColor: '#5D4037',
    intro: '庭审进入最后一天，第七个证人开口的第一句话让全场哑然。' },
  { id: 11, title: '山海拾遗录', author: '青梧', category: '玄幻', coverColor: '#0E9F6E',
    intro: '山海经缺失的十三页散落人间，拾到残页的人都会听见兽语。' },
  { id: 12, title: '城南灯火', author: '陆星辰', category: '都市', coverColor: '#E17055',
    intro: '夜班公交的末班车司机，二十年来每晚多带一位看不见的乘客。' }
];

/** 默认收藏到书架的 4 本书 */
export const DEFAULT_SHELF_IDS: number[] = [1, 3, 5, 8];

const BOOK_MAP: Map<number, BookInfo> = new Map<number, BookInfo>();
for (const book of RAW_BOOKS) {
  BOOK_MAP.set(book.id, book);
}

/** 初始化书架数据（幂等） */
export function initShelf(): void {
  if (AppStorage.get<number[]>(SHELF_KEY) === undefined) {
    AppStorage.setOrCreate<number[]>(SHELF_KEY, DEFAULT_SHELF_IDS);
  }
}

export function getShelfIds(): number[] {
  return AppStorage.get<number[]>(SHELF_KEY) ?? [];
}

export function isInShelf(id: number): boolean {
  return getShelfIds().includes(id);
}

/** 加入/移出书架，通过整体替换数组触发 @StorageLink 刷新 */
export function toggleShelf(id: number): void {
  const current = getShelfIds();
  const next: number[] = current.includes(id)
    ? current.filter((x: number) => x !== id)
    : [...current, id];
  AppStorage.set<number[]>(SHELF_KEY, next);
}

export function getBookById(id: number): BookInfo | undefined {
  return BOOK_MAP.get(id);
}

export function getShelfBooks(): BookInfo[] {
  const result: BookInfo[] = [];
  for (const id of getShelfIds()) {
    const book = BOOK_MAP.get(id);
    if (book !== undefined) {
      result.push(book);
    }
  }
  return result;
}

/** 按分类 + 关键字（书名/作者，忽略首尾空白）过滤书城书籍 */
export function filterBooks(category: string, keyword: string): BookInfo[] {
  const kw = keyword.trim();
  return RAW_BOOKS.filter((book: BookInfo): boolean => {
    const categoryMatch = category === '全部' || book.category === category;
    const keywordMatch = kw.length === 0 || book.title.includes(kw) || book.author.includes(kw);
    return categoryMatch && keywordMatch;
  });
}

const CHAPTER_NAMES: string[] = [
  '初雪', '旧约', '长街', '风起', '灯火', '归人',
  '雾散', '山门', '潮声', '残页', '夜航', '终章'
];

/** 每本书固定 12 章 */
export function getChapters(book: BookInfo): string[] {
  const chapters: string[] = [];
  for (let i = 0; i < 12; i++) {
    chapters.push(`第${i + 1}章 ${CHAPTER_NAMES[(book.id + i) % CHAPTER_NAMES.length]}`);
  }
  return chapters;
}

const PARAGRAPHS: string[] = [
  '暮色从山脊上漫下来的时候，风里已经能闻到雨水的味道。',
  '他合上书抬起头，窗外的灯火一盏一盏地亮了起来，像谁在夜色里落子。',
  '巷子深处的茶馆还没打烊，说书人的惊堂木落下，故事便又翻过一页。',
  '所有的相遇都恰逢其时，所有的告别都蓄谋已久，只是当时无人察觉。',
  '远处的钟声穿过薄雾传来，敲了七下，最后一下久久没有散去。',
  '她把信折成纸船放进河里，河水带着它拐过桥洞，从此下落不明。',
  '旧木门吱呀一声推开，灰尘在光柱里浮沉，二十年像从未过去。',
  '地图上没有标注的小镇，住着一些不愿被找到的人，和一些不该被忘记的事。',
  '雪停了，脚印从院门一直延伸到井边，又折回来，仿佛犹豫了很多次。',
  '灯芯将尽的时候，他把最后一页读完，轻轻吹熄了蜡烛。'
];

/** 生成章节正文（确定性拼接，测试用） */
export function getChapterContent(book: BookInfo, chapterIndex: number): string {
  const start = (book.id * 3 + chapterIndex) % PARAGRAPHS.length;
  const paragraphs: string[] = [];
  for (let i = 0; i < 6; i++) {
    paragraphs.push(PARAGRAPHS[(start + i * 3) % PARAGRAPHS.length]);
  }
  return paragraphs.join('\n\n');
}
