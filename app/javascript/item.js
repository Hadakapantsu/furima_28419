 window.addEventListener("load", item);

function item() {
  const text_field = document.getElementById("item-price");
  // const formData = new FormData(document.getElementById("form"));
  text_field.addEventListener("change", function(){
    const data = text_field.value;// val()でフォームのvalueを取得(数値)
    const fee = data * 0.1  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    const profit = data - fee
    const feehtml = document.getElementById("add-tax-price");
    feehtml.innerHTML = fee
    // console.log(fee.innerHTML)
    const profithtml = document.getElementById("profit");
    profithtml.innerHTML = profit
    // console.log(profit.innerHTML)
  })
}
window.addEventListener('load', item)