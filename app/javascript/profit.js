function profit() {

  const InputPrice = document.getElementById("item-price");

  InputPrice.addEventListener('input', function(){
    
    const Price = document.getElementById("item-price").value;
    const Commision = document.getElementById("add-tax-price");
    const Profit = document.getElementById("profit");
    
    const Tax = Math.floor(Price * 0.1)

    Commision.innerHTML = Tax.toLocaleString()
    Profit.innerHTML = (Price - Tax).toLocaleString()
  })
}
window.addEventListener('load', profit)