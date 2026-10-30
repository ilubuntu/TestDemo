if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
import router from "@ohos:router";
class ServiceCard extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.initParam("icon", (params && "icon" in params) ? params.icon : { "id": 16777226, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" });
        this.initParam("title", (params && "title" in params) ? params.title : '');
        this.initParam("desc", (params && "desc" in params) ? params.desc : '');
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
        this.resetParam("icon", (params && "icon" in params) ? params.icon : { "id": 16777226, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" });
        this.resetParam("title", (params && "title" in params) ? params.title : '');
        this.resetParam("desc", (params && "desc" in params) ? params.desc : '');
    }
    @Param
    readonly icon: Resource;
    @Param
    readonly title: string;
    @Param
    readonly desc: string;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 8 });
            Column.width('46%');
            Column.padding(12);
            Column.backgroundColor('#F7F8FA');
            Column.borderRadius(12);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.icon);
            Image.width(80);
            Image.height(90);
            Image.objectFit(ImageFit.Cover);
            Image.borderRadius(10);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.title);
            Text.fontSize(15);
            Text.fontWeight(FontWeight.Medium);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.desc);
            Text.fontSize(11);
            Text.fontColor('#999999');
        }, Text);
        Text.pop();
        Column.pop();
    }
    public updateStateVars(params) {
        if (params === undefined) {
            return;
        }
        if ("icon" in params) {
            this.updateParam("icon", params.icon);
        }
        if ("title" in params) {
            this.updateParam("title", params.title);
        }
        if ("desc" in params) {
            this.updateParam("desc", params.desc);
        }
    }
    rerender() {
        this.updateDirtyElements();
    }
}
class S3OverlapPage extends ViewV2 {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda, extraInfo) {
        super(parent, elmtId, extraInfo);
        this.finalizeConstruction();
    }
    public resetStateVarsOnReuse(params: Object): void {
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.height('100%');
            Column.backgroundColor('#FFFFFF');
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
            Image.create({ "id": 16777227, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" });
            Image.width(36);
            Image.height(36);
        }, Image);
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('服务中心');
            Text.fontSize(20);
            Text.fontWeight(FontWeight.Bold);
            Text.width('100%');
            Text.padding({ left: 16, top: 4, bottom: 8 });
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.width('100%');
            Column.padding({ left: 16, right: 16 });
            Column.height('50%');
            Column.justifyContent(FlexAlign.SpaceBetween);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.justifyContent(FlexAlign.SpaceBetween);
        }, Row);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ServiceCard(this, { icon: { "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '话费充值', desc: '满100减5' }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/S3OverlapPage.ets", line: 40, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            icon: { "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" },
                            title: '话费充值',
                            desc: '满100减5'
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        icon: { "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '话费充值', desc: '满100减5'
                    });
                }
            }, { name: "ServiceCard" });
        }
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ServiceCard(this, { icon: { "id": 16777223, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '流量购买', desc: '9折起' }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/S3OverlapPage.ets", line: 41, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            icon: { "id": 16777223, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" },
                            title: '流量购买',
                            desc: '9折起'
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        icon: { "id": 16777223, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '流量购买', desc: '9折起'
                    });
                }
            }, { name: "ServiceCard" });
        }
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.justifyContent(FlexAlign.SpaceBetween);
        }, Row);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ServiceCard(this, { icon: { "id": 16777221, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '水电缴费', desc: '实时到账' }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/S3OverlapPage.ets", line: 45, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            icon: { "id": 16777221, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" },
                            title: '水电缴费',
                            desc: '实时到账'
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        icon: { "id": 16777221, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '水电缴费', desc: '实时到账'
                    });
                }
            }, { name: "ServiceCard" });
        }
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ServiceCard(this, { icon: { "id": 16777222, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '燃气代缴', desc: '一键办理' }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/S3OverlapPage.ets", line: 46, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            icon: { "id": 16777222, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" },
                            title: '燃气代缴',
                            desc: '一键办理'
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        icon: { "id": 16777222, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '燃气代缴', desc: '一键办理'
                    });
                }
            }, { name: "ServiceCard" });
        }
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.width('100%');
            Row.justifyContent(FlexAlign.SpaceBetween);
        }, Row);
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ServiceCard(this, { icon: { "id": 16777220, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '火车票务', desc: '抢票提醒' }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/S3OverlapPage.ets", line: 50, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            icon: { "id": 16777220, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" },
                            title: '火车票务',
                            desc: '抢票提醒'
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        icon: { "id": 16777220, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '火车票务', desc: '抢票提醒'
                    });
                }
            }, { name: "ServiceCard" });
        }
        {
            this.observeComponentCreation2((elmtId, isInitialRender) => {
                if (isInitialRender) {
                    let componentCall = new ServiceCard(this, { icon: { "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '酒店预订', desc: '会员立减' }, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/S3OverlapPage.ets", line: 51, col: 11 });
                    ViewV2.create(componentCall);
                    let paramsLambda = () => {
                        return {
                            icon: { "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" },
                            title: '酒店预订',
                            desc: '会员立减'
                        };
                    };
                    componentCall.paramsGenerator_ = paramsLambda;
                }
                else {
                    this.updateStateVarsOfChildByElmtId(elmtId, {
                        icon: { "id": 16777225, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" }, title: '酒店预订', desc: '会员立减'
                    });
                }
            }, { name: "ServiceCard" });
        }
        Row.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 10 });
            Row.width('100%');
            Row.padding(14);
            Row.margin({ left: 16, right: 16, top: 12 });
            Row.backgroundColor('#FFF7E6');
            Row.borderRadius(10);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('📣');
            Text.fontSize(20);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 2 });
            Column.alignItems(HorizontalAlign.Start);
            Column.layoutWeight(1);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('系统公告');
            Text.fontSize(14);
            Text.fontWeight(FontWeight.Medium);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('本周五 00:00-06:00 部分服务暂停维护');
            Text.fontSize(12);
            Text.fontColor('#999999');
        }, Text);
        Text.pop();
        Column.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 12 });
            Row.width('100%');
            Row.padding(14);
            Row.margin({ left: 16, right: 16, top: 12 });
            Row.backgroundColor('#F7F8FA');
            Row.borderRadius(10);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create({ "id": 16777228, "type": 20000, params: [], "bundleName": "com.ct.cased", "moduleName": "entry" });
            Image.width(56);
            Image.height(56);
            Image.borderRadius(10);
            Image.objectFit(ImageFit.Cover);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 4 });
            Column.alignItems(HorizontalAlign.Start);
            Column.layoutWeight(1);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('新用户专享礼包');
            Text.fontSize(15);
            Text.fontWeight(FontWeight.Medium);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('开通会员立减 20 元，限时领取');
            Text.fontSize(12);
            Text.fontColor('#999999');
        }, Text);
        Text.pop();
        Column.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('领取');
            Text.fontSize(13);
            Text.fontColor('#FFFFFF');
            Text.padding({ left: 14, right: 14, top: 6, bottom: 6 });
            Text.backgroundColor('#E54545');
            Text.borderRadius(14);
        }, Text);
        Text.pop();
        Row.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "S3OverlapPage";
    }
}
registerNamedRoute(() => new S3OverlapPage(undefined, {}), "", { bundleName: "com.ct.cased", moduleName: "entry", pagePath: "pages/S3OverlapPage", pageFullPath: "entry/src/main/ets/pages/S3OverlapPage", integratedHsp: "false", moduleType: "followWithHap" });
