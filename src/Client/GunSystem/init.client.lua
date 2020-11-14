local GUN_TAG = "Gun"
local CollectionService = game:GetService("CollectionService")
local p = game.Players.LocalPlayer
local core = require(game.ReplicatedStorage.Core)
local collection = core("collection")

function init(tool)
	if tool.Parent == p:WaitForChild("Backpack") then
		local tags = CollectionService:GetTags(tool)
		local gunModule
		for _,tag in pairs(tags) do
			gunModule = script:FindFirstChild(tag)
			if gunModule then
				require(gunModule).init(tool)
				break
			end
		end
	end
end

collection(GUN_TAG, init)