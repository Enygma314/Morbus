/*------------------------------------
  Morbus 2
  Zachary Nawar - zachary.nawar.org
  ------------------------------------*/

/* GMOD Gamemode Data */
GM.Name = "Morbus 2"
GM.Author = "Zachary Nawar"
GM.Website = "http://morbus.remscar.com"

/* Morbus Global Data */
if not Morbus then
  Morbus = {}
end

/* Version data */
Morbus.Version = "2.0.0"
Morbus.VersionNumber = 200
Morbus.Folder = GM.Folder:gsub("gamemodes/", "")


/* Enum Helper */
local function Enum(type, name, reset)
  local typeCounter = "enum"..type.."counter"
  if not _G[typeCounter] or reset then
    _G[typeCounter] = 1
    _G["Enum"..type] = {}
  else
    _G[typeCounter] = _G[typeCounter] + 1
  end

  _G["e"..type..name] = _G[typeCounter]
  _G["e"..type.."Count"] = _G[typeCounter]

  _G["Enum"..type][_G[typeCounter]] = name
end

local function EnumList(type, ...)
  local enumList = {...}
  local typeCounter = "enum"..type.."counter"

  _G[typeCounter] = 0
  _G["Enum"..type] = {}

  for i, v in ipairs(enumList) do
    Enum(type, v)
  end
end



/* Morbus Round Enums */
EnumList("Round", "Wait", "Prep", "Active", "Evac", "Post")

/* Morbus Gender Enums */
EnumList("Gender", "Male", "Female")

/* Morbus Role Enums */
EnumList("Role", "Human", "Brood", "Swarm", "None")

/* Morbus Need Enums */
EnumList("Need", "None", "Sleep", "Eat", "Clean", "Bathroom")

/* Morbus Teams */
EnumList("Team", "Human", "Alien")

/* Morbus Win Types */
EnumList("Win", "None", "Human", "Alien")

/* Morbus Weapon Types */
EnumList("WType", "Melee", "Handgun", "Light", "Rifle", "Heavy", "Misc", "Role", "Mission")

/* Morbus Ammo Types */
EnumList("Ammo", "Pistol", "SMG", "Rifle", "Shotgun", "Battery")

/* GMOD Teams */
EnumList("GTeam", "Players", "Spectators")

team.SetUp(eGTeamPlayers, "Players", Color(200, 200, 200), true)
team.SetUp(eGTeamSpectators, "Spectators", Color(255, 125, 0), true)

EnumList("Weapon",
  "Beretta",
  "R22",
  "KA47")
