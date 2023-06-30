local frame = CreateFrame("FRAME", "AutoSellFrame");
frame:RegisterEvent("MERCHANT_SHOW");

local function eventHandler(self, event, ...)
	
	if event == "MERCHANT_SHOW" then
		local numCards = 0;
		for bag=0,NUM_BAG_SLOTS do
			for slot=1,C_Container.GetContainerNumSlots(bag) do
				local itemID = C_Container.GetContainerItemID(bag, slot)
				local cardName = GetItemInfo(199143) -- get card name initial
				if itemID then
					local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemID)
					if itemName == cardName then
						numCards = numCards + 1;
						C_Container.UseContainerItem(bag, slot)
					end
				end
			end
		end
		if numCards > 0 then
			if numCards == 1 then
				print("\124cffFFD700AutoSellFatedFortuneCards: Sold", numCards, "Fated Fortune Card\124r")
			else
				print("\124cffFFD700AutoSellFatedFortuneCards: Sold", numCards, "Fated Fortune Cards\124r")
			end
			
		end
	end
end


frame:SetScript("OnEvent", eventHandler);
