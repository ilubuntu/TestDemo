if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
interface Card {
    flag: Resource;
    code: string;
    name: string;
    rate: string;
}
class BrokenLayoutPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.cards = [
            { flag: { "id": 16777222, "type": 20000, params: [], "bundleName": "com.ct.casec", "moduleName": "entry" }, code: 'USD', name: '美元', rate: '7.21' },
            { flag: { "id": 16777221, "type": 20000, params: [], "bundleName": "com.ct.casec", "moduleName": "entry" }, code: 'JPY', name: '日元', rate: '0.048' },
            { flag: { "id": 16777220, "type": 20000, params: [], "bundleName": "com.ct.casec", "moduleName": "entry" }, code: 'EUR', name: '欧元', rate: '7.83' }
        ];
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
    }
    private cards: Card[];
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create();
            Stack.width('100%');
            Stack.height('100%');
            Stack.backgroundColor('#FFFFFF');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.padding(12);
            Row.margin({ top: 40 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(48);
            Column.height(48);
            Column.justifyContent(FlexAlign.Center);
            Column.onClick(() => { router.back(); });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777224, "type": 20000, params: [], "bundleName": "com.ct.casec", "moduleName": "entry" });
            Image.width(36);
            Image.height(36);
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.margin({ top: 16 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = (_item, idx: number) => {
                const c = _item;
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Column.create({ space: 8 });
                    Column.width(312);
                    Column.padding(12);
                    Column.backgroundColor('#F7F8FA');
                    Column.borderRadius(12);
                }, Column);
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Image.create(c.flag);
                    Image.width(280);
                    Image.height(160);
                    Image.objectFit(ImageFit.Cover);
                    Image.borderRadius(8);
                }, Image);
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Row.create();
                    Row.width('100%');
                }, Row);
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create(`${c.code} ${c.name}`);
                    Text.fontSize(16);
                    Text.fontWeight(FontWeight.Medium);
                    Text.layoutWeight(1);
                }, Text);
                Text.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Text.create(c.rate);
                    Text.fontSize(16);
                    Text.fontColor('#E6810C');
                }, Text);
                Text.pop();
                Row.pop();
                Column.pop();
            };
            this.forEachUpdateFunction(elmtId, this.cards, forEachItemGenFunction, (c: Card, idx: number) => `card-${idx}`, true, true);
        }, ForEach);
        ForEach.pop();
        Row.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('HOT');
            Text.fontSize(12);
            Text.fontColor('#FFFFFF');
            Text.backgroundColor('#E54545');
            Text.padding({ left: 8, right: 8, top: 3, bottom: 3 });
            Text.borderRadius(8);
            Text.position({ x: 330, y: 210 });
        }, Text);
        Text.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "BrokenLayoutPage";
    }
}
registerNamedRoute(() => new BrokenLayoutPage(undefined, {}), "", { bundleName: "com.ct.casec", moduleName: "entry", pagePath: "pages/BrokenLayoutPage", pageFullPath: "entry/src/main/ets/pages/BrokenLayoutPage", integratedHsp: "false", moduleType: "followWithHap" });
