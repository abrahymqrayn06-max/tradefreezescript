-- LocalScript ينفذ داخل StarterPlayerScripts أو Gui
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function checkMyInventory()
    print("--- قائمة الفواكه والأدوات في حقيبتك ---")
    
    -- قراءة العناصر داخل الشنطة
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                print("أداة/فاكهة: " .. tool.Name)
            end
        end
    end
end

-- تشغيل الفحص عند الضغط أو البدء
checkMyInventory()
