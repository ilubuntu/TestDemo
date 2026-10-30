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
        new Currency({ "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'USD', '美元', '7.21'),
        new Currency({ "id": 16777223, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'JPY', '日元', '0.048'),
        new Currency({ "id": 16777221, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'EUR', '欧元', '7.83'),
        new Currency({ "id": 16777222, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'GBP', '英镑', '9.12'),
        new Currency({ "id": 16777220, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'CNY', '人民币', '1.00'),
        new Currency({ "id": 16777224, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'KRW', '韩元', '0.0053'),
        new Currency({ "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'USD', '美元现汇', '7.19'),
        new Currency({ "id": 16777223, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" }, 'JPY', '日元现汇', '0.047')
    ];
}
