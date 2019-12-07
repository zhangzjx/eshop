//****************针对第一种方式的具体js实现部分******************//
//****************所使用的数据是city.js******************//

/*根据id获取对象*/
function $(str) {
    return document.getElementById(str);
}

const addrShow = $('addr-show');
const addrShowHidden = $('addr-show2');
const btn = document.getElementsByClassName('met1')[0];
const prov = $('prov');
const city = $('city');
const country = $('country');


/*用于保存当前所选的省市区*/
const current = {
    prov: '',
    city: '',
    country: ''
};

/*自动加载省份列表*/
(function showProv() {
    btn.disabled = true;
    const len = provice.length;
    for (let i = 0; i < len; i++) {
        const provOpt = document.createElement('option');
        provOpt.innerText = provice[i]['name'];
        provOpt.value = i;
        prov.appendChild(provOpt);
    }
})();

/*根据所选的省份来显示城市列表*/
function showCity(obj) {
    const val = obj.options[obj.selectedIndex].value;
    if (val != current.prov) {
        current.prov = val;
        addrShow.value = '';
        btn.disabled = true;
    }
    //console.log(val);
    if (val != null) {
        city.length = 1;
        const cityLen = provice[val]["city"].length;
        for (let j = 0; j < cityLen; j++) {
            const cityOpt = document.createElement('option');
            cityOpt.innerText = provice[val]["city"][j].name;
            cityOpt.value = j;
            city.appendChild(cityOpt);
        }
    }
}

/*根据所选的城市来显示县区列表*/
function showCountry(obj) {
    const val = obj.options[obj.selectedIndex].value;
    current.city = val;
    if (val != null) {
        country.length = 1; //清空之前的内容只留第一个默认选项
        const countryLen = provice[current.prov]["city"][val].districtAndCounty.length;
        if(countryLen == 0){
            addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name;
            return;
        }
        for (let n = 0; n < countryLen; n++) {
            const countryOpt = document.createElement('option');
            countryOpt.innerText = provice[current.prov]["city"][val].districtAndCounty[n];
            countryOpt.value = n;
            country.appendChild(countryOpt);
        }
    }
}

/*选择县区之后的处理函数*/
function selecCountry(obj) {
    current.country = obj.options[obj.selectedIndex].value;
    if ((current.city != null) && (current.country != null)) {
        btn.disabled = false;
    }
}

/*点击确定按钮显示用户所选的地址*/
function showAddr() {
   //addrShowHidden.value = provice[current.prov].name + provice[current.prov]["city"][current.city].name + provice[current.prov]["city"][current.city].districtAndCounty[current.country];
    addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name + '-' + provice[current.prov]["city"][current.city].districtAndCounty[current.country];

}