local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- رابط الـ Webhook الخاص بك
local webhookUrl = "https://discord.com/api/webhooks/1553068522077298698/MXBmQ3HAGiGdWEzYCwaiP6od0NPox08YhR1I2TkzzQRo2R4wtJbiM9QCkrV5C3HCE02G"

-- تجهيز بيانات الإشعار بتصميم Embed
local embedData = {
    ["title"] = "🚨 إشعار تشغيل السكربت!",
    ["description"] = "قام أحد المستخدمين بتشغيل السكربت الخاص بك الآن.",
    ["color"] = 65280, -- لون أخضر (Hex: #00FF00)
    ["fields"] = {
        {
            ["name"] = "👤 اسم اللاعب:",
            ["value"] = LocalPlayer.Name .. " (@" .. LocalPlayer.DisplayName .. ")",
            ["inline"] = true
        },
        {
            ["name"] = "🆔 آيدي اللاعب (UserId):",
            ["value"] = tostring(LocalPlayer.UserId),
            ["inline"] = true
        },
        {
            ["name"] = "🎮 اسم اللعبة / الماب:",
            ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
            ["inline"] = false
        },
        {
            ["name"] = "🔗 رابط حساب اللاعب:",
            ["value"] = "https://www.roblox.com/users/" .. LocalPlayer.UserId .. "/profile",
            ["inline"] = false
        }
    },
    ["footer"] = {
        ["text"] = "تنبيه تشغيل السكربت • Roblox Logger"
    },
    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

local payload = HttpService:JSONEncode({
    ["username"] = "Roblox Logger Bot",
    ["avatar_url"] = "https://upload.wikimedia.org/wikipedia/commons/3/3a/Roblox_player_icon_black.png",
    ["embeds"] = {embedData}
})

-- إرسال الإشعار إلى ديسكورد عبر Executor
local request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

if request then
    request({
        Url = webhookUrl,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = payload
    })
else
    -- طريقة احتياطية في حال كان المشغل يستخدم HttpPost المباشر
    pcall(function()
        game:HttpPost(webhookUrl, payload, false, "application/json")
    end)
end

-- اكتب بقية كود السكربت الأساسي هنا (مثلاً واجهة السكربت أو الميزات)
print("Script Executed Successfully!")
