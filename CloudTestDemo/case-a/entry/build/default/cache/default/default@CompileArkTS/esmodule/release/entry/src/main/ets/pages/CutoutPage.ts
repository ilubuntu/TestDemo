if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
import { buildCurrencies } from "@normalized:N&&&entry/src/main/ets/model/Currency&";
import type { Currency } from "@normalized:N&&&entry/src/main/ets/model/Currency&";
class CutoutPage extends ViewV2 {
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
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#F5F6F8');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 6 });
            Row.justifyContent(FlexAlign.Center);
            Row.width('92%');
            Row.height(44);
            Row.backgroundColor('#FFFFFF');
            Row.borderRadius(22);
            Row.margin({ top: 0 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('⌕');
            Text.fontSize(16);
            Text.fontColor('#999999');
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('搜索货币 / 国家');
            Text.fontSize(14);
            Text.fontColor('#AAAAAA');
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.padding(12);
            Row.margin({ top: 24 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width(48);
            Column.height(48);
            Column.justifyContent(FlexAlign.Center);
            Column.onClick(() => { router.back(); });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777227, "type": 20000, params: [], "bundleName": "com.ct.casea", "moduleName": "entry" });
            Image.width(36);
            Image.height(36);
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            List.create({ space: 0 });
            List.layoutWeight(1);
            List.width('100%');
            List.scrollBar(BarState.Off);
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
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "CutoutPage";
    }
}
registerNamedRoute(() => new CutoutPage(undefined, {}), "", { bundleName: "com.ct.casea", moduleName: "entry", pagePath: "pages/CutoutPage", pageFullPath: "entry/src/main/ets/pages/CutoutPage", integratedHsp: "false", moduleType: "followWithHap" });
