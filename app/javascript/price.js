function price() {
  const ItemPrice = document.getElementById("item-price");
  ItemPrice.addEventListener("keyup", () => {
    const taxVal = 0.1;
    const AddTaxPrice = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    const addtax_num = Math.floor(ItemPrice.value * taxVal)
    const profit_num = Math.floor(ItemPrice.value / (1 + taxVal))
    AddTaxPrice.innerHTML = `${addtax_num.toLocaleString()}`;
    Profit.innerHTML = `${profit_num.toLocaleString()}`;
  });
}

window.addEventListener('load', price);