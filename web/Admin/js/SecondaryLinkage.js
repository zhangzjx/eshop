//二级联动
let where = new Array(35);
function comefrom(firstLink,secondLink) { this.firstLink = firstLink; this.secondLink = secondLink; }
where[0]=new comefrom("请选择一级分类","二级分类");
where[1]=new comefrom("数码电器","家用电器|手机通信|电脑数码");
where[2]=new comefrom("食品","乳饮酒水|零食|粮油调味|方便速食|茶");
where[3]=new comefrom("日用百货","纸品湿巾|家用清洁|餐饮用具|文具教具|绿植宠物|洗浴用品|");
where[4]=new comefrom("生鲜","新鲜水果|美味蔬菜|新鲜肉类|禽蛋|海鲜水产|锅物料理");
where[5]=new comefrom("服饰箱包","男装|女装|女士包袋|功能类箱包");
where[6]=new comefrom("美妆","护肤|彩妆|美容美体");
document.creator = undefined;
document.creator.newlocation = undefined;
document.creator.categories = undefined;
document.creator.categories_two = undefined;

function select() {
    let firstLink2,firstLink3,firstLink4;
    with(document.creator.categories) { firstLink2 = options[selectedIndex].value; }
    for (let i = 0; i < where.length; i++) {
        if (where[i].firstLink == firstLink2) {
            firstLink3 = (where[i].secondLink).split("|");
            for (let j = 0; j < firstLink3.length; j++) {
                with (document.creator.categories_two) {
                    length = firstLink3.length;
                    options[j].text = firstLink3[j];
                    options[j].value = firstLink3[j];
                    firstLink4 = options[selectedIndex].value;
                }
            }
            break;
        }
    }
    document.creator.newlocation.value=firstLink2+firstLink4;  }
//页面加载后执行onload事件，页面载入完毕后执行Javascript代码
function init() {
    with(document.creator.categories) {
        length = where.length;
        for(let k=0;k<where.length;k++) {
            options[k].text = where[k].firstLink; options[k].value = where[k].firstLink; }
        options[selectedIndex].text = where[0].firstLink;
        options[selectedIndex].value = where[0].firstLink; }

    with(document.creator.categories_two) {
        loca3=(where[0].secondLink).split("|");
        length=loca3.length;
        for(let l=0;l<length;l++) {
            options[l].text = firstLink[l]; options[l].value = firstLink[l]; }
        let firstLink3;
        options[selectedIndex].text = firstLink3[0];
        options[selectedIndex].value = firstLink3[0];}
}
