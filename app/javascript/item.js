function calc(){
  const addPrice = document.getElementById("item-price");
  addPrice.addEventListener("keyup", ()=>{
    const addTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    const Price = addPrice.value;
    addTaxPrice.innerHTML = Math.floor(Price / 10);
    Profit.innerHTML = Math.floor(Price - (Price / 10));
  })
}

window.addEventListener('load', calc);