if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
import { buildCurrencies } from "@normalized:N&&&entry/src/main/ets/model/Currency&";
import type { Currency } from "@normalized:N&&&entry/src/main/ets/model/Currency&";
class Index extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.currencies = buildCurrencies();
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.currencies = buildCurrencies();
    }
    @Local
    currencies: Currency[];
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Stack.create({ alignContent: Alignment.Bottom });
            Stack.width('100%');
            Stack.height('100%');
        }, Stack);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#FFFFFF');
            Column.padding({ bottom: 132 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('汇率速查');
            Text.fontSize(20);
            Text.fontWeight(FontWeight.Bold);
            Text.width('100%');
            Text.padding({ left: 16, top: 44, bottom: 4 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 8 });
            Row.width('100%');
            Row.padding({ left: 12, right: 12, bottom: 8 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('状态栏页');
            Button.fontSize(12);
            Button.height(32);
            Button.layoutWeight(1);
            Button.onClick(() => { router.pushUrl({ url: 'pages/StatusBarCutPage' }); });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('挖孔页');
            Button.fontSize(12);
            Button.height(32);
            Button.layoutWeight(1);
            Button.onClick(() => { router.pushUrl({ url: 'pages/CutoutPage' }); });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('高留白');
            Button.fontSize(12);
            Button.height(32);
            Button.layoutWeight(1);
            Button.onClick(() => { router.pushUrl({ url: 'pages/SparsePage' }); });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('低留白');
            Button.fontSize(12);
            Button.height(32);
            Button.layoutWeight(1);
            Button.onClick(() => { router.pushUrl({ url: 'pages/DensePage' }); });
        }, Button);
        Button.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            List.create({ space: 0 });
            List.layoutWeight(1);
            List.width('100%');
            List.scrollBar(BarState.Off);
            List.divider({ strokeWidth: 0.5, color: '#EEEEEE', startMargin: 64 });
        }, List);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const c = _item;
                {
                    const itemCreation = (elmtId, isInitialRender) => {
                        ViewStackProcessor.StartGetAccessRecordingFor(elmtId);
                        ListItem.create(deepRenderFunction, true);
                        if (!isInitialRender) {
                            ListItem.pop();
                        }
                        ViewStackProcessor.StopGetAccessRecording();
                    };
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        ListItem.create(deepRenderFunction, true);
                    };
                    const deepRenderFunction = (elmtId, isInitialRender) => {
                        itemCreation(elmtId, isInitialRender);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Row.create({ space: 12 });
                            Row.width('100%');
                            Row.padding({ left: 16, right: 16, top: 10, bottom: 10 });
                        }, Row);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Image.create(c.flag);
                            Image.width(36);
                            Image.height(36);
                            Image.borderRadius(18);
                            Image.objectFit(ImageFit.Cover);
                        }, Image);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Column.create();
                            Column.alignItems(HorizontalAlign.Start);
                            Column.layoutWeight(1);
                        }, Column);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(c.code);
                            Text.fontSize(15);
                            Text.fontWeight(FontWeight.Medium);
                        }, Text);
                        Text.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(c.name);
                            Text.fontSize(12);
                            Text.fontColor('#999999');
                        }, Text);
                        Text.pop();
                        Column.pop();
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create(c.rate);
                            Text.fontSize(16);
                            Text.fontColor('#333333');
                        }, Text);
                        Text.pop();
                        Row.pop();
                        ListItem.pop();
                    };
                    this.observeComponentCreation2(itemCreation2, ListItem);
                    ListItem.pop();
                }
            };
            this.forEachUpdateFunction(elmtId, this.currencies, forEachItemGenFunction, (c: Currency) => c.code + c.name, false, false);
        }, ForEach);
        ForEach.pop();
        List.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 8 });
            Column.width('100%');
            Column.padding({ left: 16, right: 16, top: 12, bottom: 0 });
            Column.backgroundColor('#2F3138');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TextInput.create({ placeholder: '输入货币代码查询' });
            TextInput.height(40);
            TextInput.backgroundColor('#3A3D45');
            TextInput.fontColor('#FFFFFF');
            TextInput.placeholderColor('#888888');
            TextInput.borderRadius(8);
        }, TextInput);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('查询');
            Button.width('100%');
            Button.height(56);
            Button.fontSize(16);
        }, Button);
        Button.pop();
        Column.pop();
        Stack.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Index";
    }
}
registerNamedRoute(() => new Index(undefined, {}), "", { bundleName: "com.ct.casea", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false", moduleType: "followWithHap" });
