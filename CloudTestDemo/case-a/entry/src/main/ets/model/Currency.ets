export class Currency {
  flag: Resource;
  code: string;
  name: string;
  rate: string;
  constructor(flag: Resource, code: string, name: string, rate: string) {
    this.flag = flag;
    this.code = code;
    this.name = name;
    this.rate = rate;
  }
}

export function buildCurrencies(): Currency[] {
  return [
    new Currency($r('app.media.flag_usd'), 'USD', '美元', '7.21'),
    new Currency($r('app.media.flag_jpy'), 'JPY', '日元', '0.048'),
    new Currency($r('app.media.flag_eur'), 'EUR', '欧元', '7.83'),
    new Currency($r('app.media.flag_gbp'), 'GBP', '英镑', '9.12'),
    new Currency($r('app.media.flag_cny'), 'CNY', '人民币', '1.00'),
    new Currency($r('app.media.flag_krw'), 'KRW', '韩元', '0.0053'),
    new Currency($r('app.media.flag_usd'), 'USD', '美元现汇', '7.19'),
    new Currency($r('app.media.flag_jpy'), 'JPY', '日元现汇', '0.047')
  ];
}
