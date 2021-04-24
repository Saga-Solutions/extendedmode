window.addEventListener("message", function (event) {
    if (event.data.action == "join") {
        document.getElementById('text').style.display = "block"
        document.getElementById('text').innerHTML = `🎤 ${event.data.label}`
    } else if (event.data.action == "leave") {
        document.getElementById('text').style.display = "none"
        document.getElementById('text').innerHTML = ""
    }
})