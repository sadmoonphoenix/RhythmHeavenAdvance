-- Lua script for mGBA, last worked on 0.10, might not work on newer versions. You're warned.

oamLog_textBuf = console:createBuffer("OAM Data")
sprLog_textBuf = console:createBuffer("Sprite Data")

logOAMLocation = 0x02021000;
logSpriteLocation = 0x02021100;


function ClearData()
	local cleardataoffset = logOAMLocation;
	local clearentrycount = emu:read32(cleardataoffset);
	emu:write32(cleardataoffset,0);
	dataoffset = cleardataoffset + 4;
	for i=0,clearentrycount-1,1 do
		emu:write32(cleardataoffset,0);
		cleardataoffset = cleardataoffset + 4;
	end
	
	local cleardataoffset = logSpriteLocation;
	local clearentrycount = emu:read32(cleardataoffset);
	emu:write32(cleardataoffset,0);
	dataoffset = cleardataoffset + 4;
	for i=0,clearentrycount-1,1 do
		emu:write32(cleardataoffset,0);
		cleardataoffset = cleardataoffset + 4;
	end
end

function DisplayData()
	local dataoffset = logOAMLocation;
	
	local entrycount = emu:read32(dataoffset);
	dataoffset = dataoffset + 4;
	for i=0,entrycount-1,1 do
		local entry = string.format("n°%X: 0x0%X",i,emu:read32(dataoffset));
		oamLog_textBuf:moveCursor(0,i)
		oamLog_textBuf:print(entry);
		dataoffset = dataoffset + 4;
	end
	
	local dataoffset = logSpriteLocation;
	
	local entrycount = emu:read32(dataoffset);
	dataoffset = dataoffset + 4;
	for i=0,entrycount-1,1 do
		local entry = string.format("n°%X: 0x0%X in VRAM: 0x0%X",i+1,emu:read32(dataoffset),emu:read32(dataoffset+4));
		sprLog_textBuf:moveCursor(0,i)
		sprLog_textBuf:print(entry);
		dataoffset = dataoffset + 8;
	end
end

function update()
	oamLog_textBuf:clear()
	sprLog_textBuf:clear()
	
	local keys = emu:getKeys()
	
	if(keys == 4) then
		ClearData()
	end
	
	DisplayData()
end

console:log("This script only works if you have enabled the flag(s) in the compile.asm file.")
callbacks:add("frame", update)