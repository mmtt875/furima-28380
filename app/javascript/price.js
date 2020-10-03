window.addEventListener('load',function(){
  const priceId = document.getElementById("item-price")
  priceId.addEventListener('input',function(){
    const price = document.getElementById("item-price").value;
    const priceFee = Math.floor(price / 10)
    const salesProfit = price - priceFee
    const priceFeeId = document.getElementById("add-tax-price")
      priceFeeId.innerHTML = priceFee;
    const salesProfitId = document.getElementById("profit")
      salesProfitId.innerHTML = salesProfit;
  })
  
})