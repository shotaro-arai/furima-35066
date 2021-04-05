const pay = ()=> {

  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  const chargeForm = document.getElementById("charge-form");
  chargeForm.addEventListener("submit",(e)=>{
    e.preventDefault();

    const chargeData = document.getElementById("charge-form");
    const formData = new FormData(chargeData);
    
    const card = {
      number: formData.get("sales_record_address[number]"),
      exp_month: formData.get("sales_record_address[exp_month]"),
      exp_year: `20${formData.get("sales_record_address[exp_year]")}`,
      cvc: formData.get("sales_record_address[cvc]"),
    };

    Payjp.createToken(card,(status, response)=>{
      if (status == 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObject = `<input value=${token} name="token" type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObject);
        
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");

        document.getElementById("charge-form").submit();
      };
    });
  });
};


window.addEventListener("load", pay);