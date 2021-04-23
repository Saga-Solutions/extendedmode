resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

description "Simple Notification Script using https://notifyjs.com/"

ui_page "html/index.html"

client_script "cl_notify.lua"

export "SetQueueMax"
export "SendNotification"

files {
    "html/index.html",
    "html/pNotify.js",
    "html/noty.js",
    "html/noty.css",
    "html/themes.css",
    "html/sound-example.wav"
}
