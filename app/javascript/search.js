const search = () =>{
  const inputElement = document.getElementById("keyword")
  inputElement.addEventListener("keyup", ()=>{
    const keyword = document.getElementById("keyword").value;
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/items/incremental_search?keyword=${keyword}`, true);
    XHR.responseType = "json";
    XHR.send();

    XHR.onload = ()=>{
      const searchForm = document.getElementById("incremental-search");
      searchForm.innerHTML = "";
      if (XHR.response){
        const searchName = XHR.response.keyword;
        searchName.forEach((item)=>{
          const childElement = document.createElement("div");
          childElement.setAttribute("class", "child");
          childElement.setAttribute("id", item.id)
          childElement.innerHTML = item.name;
          searchForm.appendChild(childElement);

          const clickElement = document.getElementById(item.id)
          clickElement.addEventListener("click", ()=>{
            document.getElementById("keyword").value = clickElement.textContent;
            clickElement.remove();
          });
        });
      };
    };
  });
};

window.addEventListener("load", search);