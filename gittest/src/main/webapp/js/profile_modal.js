const section = document.querySelector("section"),
    setBtn = section.document.querySelector("#setBtn");
    closeBtn = section.document.querySelectorAll("#close");

    hireBtn.addEventListener("click",()=>{
        section.classList.add("show");
    });
    
    closeBtn.forEach(cBtn => {
        cBtn.addEventListener.remove("click",()=>{
            section.classList.remove("show");
        });
    });