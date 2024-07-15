local notify = {}
--patch 1
local TweenService = game:GetService('TweenService')

notify.colors = {
    ['Background'] = Color3.fromRGB(10, 10, 10),
    ['LoadingBack'] = Color3.fromRGB(30, 30, 30),
    ['LoadingFront'] = Color3.fromRGB(243, 117, 255)
} 

local HolderContainer = nil

function notify.init(guiname)

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = tostring(guiname) or 'notifysakuraxx'
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Holder = Instance.new("Frame")
    Holder.Name = "Holder"
    Holder.Parent = ScreenGui
    Holder.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Holder.BackgroundTransparency = 1
    Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Holder.BorderSizePixel = 0
    Holder.Position = UDim2.new(0.0406461693, 0, 0.216666669, 0)
    Holder.Size = UDim2.new(0.182775706, 0, 0.759305239, 0)

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = Holder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 3)

    HolderContainer = Holder

    return 'init-succes'

end

function notify.notify(notification : string, duration : number)
    if not typeof(tostring(notification)) == 'string' then return end
    if not HolderContainer then return end
    local Notification = Instance.new("Frame")
    Notification.Name = "Notification"
    Notification.Parent = HolderContainer
    Notification.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Notification.BorderColor3 = Color3.fromRGB(255, 255, 255)
    Notification.BorderSizePixel = 0
    Notification.Position = UDim2.new(-5.17247081e-08, 0, 0, 0)
    Notification.Size = UDim2.new(4.97288132, 0, 0.0424836613, 0)
    Notification.Visible = false
    local Notification_2 = Instance.new("TextLabel")
    Notification_2.Name = "Notification"
    Notification_2.Parent = Notification
    Notification_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Notification_2.BackgroundTransparency = 1.000
    Notification_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Notification_2.BorderSizePixel = 0
    Notification_2.Position = UDim2.new(0, 0, 0.256371707, 0)
    Notification_2.Size = UDim2.new(1, 0, 0.478260934, 0)
    Notification_2.Font = Enum.Font.Ubuntu
    Notification_2.Text = "Notification"
    Notification_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notification_2.TextScaled = true
    Notification_2.TextSize = 14.000
    Notification_2.TextWrapped = true
    Notification_2.TextXAlignment = Enum.TextXAlignment.Center
    Notification_2.TextYAlignment = Enum.TextYAlignment.Center
    local bounds = Notification_2.TextBounds
    Notification.Size = UDim2.new(0, 0, 0.042, 0)
    local Top = Instance.new("Frame")
    local Bar = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Notification
    Top.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
    Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Top.BorderSizePixel = 0
    Top.Position = UDim2.new(0, 0, 0.986957073, 0)
    Top.Size = UDim2.new(1, 0, 0.0434782617, 0)
    Bar.Name = "Bar"
    Bar.Parent = Top
    Bar.BackgroundColor3 = Color3.fromRGB(243, 117, 255)
    Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Bar.BorderSizePixel = 0
    Bar.Size = UDim2.new(1, 0, 1, 0)

    local TweenIn = TweenService:Create(Notification, TweenInfo.new(.25), {Size = UDim2.new(0, bounds.X + 25, 0.042, 0)})
    TweenIn:Play()
    TweenIn.Completed:Wait()

    local TweenBar = TweenService:Create(Bar, TweenInfo.new(duration or 5), {Size = UDim2.new(0, 0, 1, 0)})
    TweenBar:Play()
    TweenBar.Completed:Wait()

    local TweenOut = TweenService:Create(Notification, TweenInfo.new(.25), {Size = UDim2.new(0, 0, 0.042, 0)})
    TweenOut:Play()
    TweenOut.Completed:Wait()

    Notification:Destroy()

end


local init = notify.init(math.random(10000, 99999))
if init ~= 'init-succes' then game.Players.LocalPlayer:Kick('failed notify init') end

return notify
