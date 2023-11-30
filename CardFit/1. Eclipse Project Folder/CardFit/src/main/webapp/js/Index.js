        let contextBox = document.getElementById("contextBox");
        let aboutBox = document.getElementById("aboutBox");
        let header = document.querySelector("header");
        const img = new Image();
            img.src = `source/image/siteInfo.png`;
        contextBox.addEventListener("mouseover", function(){
            aboutBox.style.display = "none";
            contextBox.style.width = "1200px";
            contextBox.style.height = "68vh";
            contextBox.style.left = "10vw";
            contextBox.style.transition = "1s";
            contextBox.style.zIndex ="0";
            header.style.height = "149.8vh";
            header.style.transition = "1s";
            contextBox.appendChild(img);
            img.style.width = "60vw";
            img.style.height = "40vh";
            img.style.position = "relative";
            img.style.zIndex ="99999";
        });
        contextBox.addEventListener("mouseout", function(){
            aboutBox.style.display = "block";
            contextBox.style.width = "40vw";
            contextBox.style.height = "18vh";
            contextBox.style.left = "52vw";
            contextBox.style.transition = "1s";
            header.style.height = "99.8vh";
            header.style.transition = "1s";
            contextBox.removeChild(img)
        });
	
