window.addEventListener("message", function(event) {
    const data = event.data;
    const ammoBox = document.getElementById("ammoBox");
    const ammoText = document.getElementById("ammoText");

    if (data.action === "updateAmmo") {
        ammoBox.style.display = "flex";
        ammoText.textContent = `${data.clip} / ${data.reserve}`;
    } else if (data.action === "hide") {
        ammoBox.style.display = "none";
    }
});
