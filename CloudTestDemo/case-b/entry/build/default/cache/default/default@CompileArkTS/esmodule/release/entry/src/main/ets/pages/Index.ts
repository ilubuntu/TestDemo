if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
class Index extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.cells = [
            { "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" },
            { "id": 16777223, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" },
            { "id": 16777221, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" },
            { "id": 16777222, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" },
            { "id": 16777220, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" },
            { "id": 16777224, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" }
        ];
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
    }
    private cells: Resource[];
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Scroll.create();
            Scroll.width('100%');
            Scroll.height('100%');
            Scroll.scrollable(ScrollDirection.Vertical);
            Scroll.scrollBar(BarState.Auto);
            Scroll.backgroundColor('#FFFFFF');
        }, Scroll);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.padding({ bottom: 48 });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('环球资讯');
            Text.fontSize(20);
            Text.fontWeight(FontWeight.Bold);
            Text.width('100%');
            Text.padding({ left: 16, top: 44, bottom: 8 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777228, "type": 20000, params: [], "bundleName": "com.ct.caseb", "moduleName": "entry" });
            Image.width('100%');
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 6 });
            Row.width('100%');
            Row.padding({ left: 12, right: 12, top: 10 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const img = _item;
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Image.create(img);
                    Image.height(20);
                    Image.aspectRatio(1);
                    Image.objectFit(ImageFit.Cover);
                    Image.borderRadius(2);
                }, Image);
            };
            this.forEachUpdateFunction(elmtId, this.cells, forEachItemGenFunction, (img: Resource, idx: number) => `g-${idx}`, false, true);
        }, ForEach);
        ForEach.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 12 });
            Row.width('100%');
            Row.padding(16);
            Row.margin({ top: 12 });
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('图文详情页');
            Button.layoutWeight(1);
            Button.height(40);
            Button.fontSize(14);
            Button.onClick(() => { router.pushUrl({ url: 'pages/DetailPage' }); });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel('半模态弹窗页');
            Button.layoutWeight(1);
            Button.height(40);
            Button.fontSize(14);
            Button.onClick(() => { router.pushUrl({ url: 'pages/SheetPage' }); });
        }, Button);
        Button.pop();
        Row.pop();
        Column.pop();
        Scroll.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "Index";
    }
}
registerNamedRoute(() => new Index(undefined, {}), "", { bundleName: "com.ct.caseb", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false", moduleType: "followWithHap" });
