--#region HealValue
function GetSpellHValue(spellID)
    local mastery, coefficient = GetMasteryEffect() --coefficient  Вообще нигде не используется
    local spell_description = GetSpellDescription(spellID)
    if spell_description == nil then return nil end
    local i, j = string.find(spell_description, "%d+ ед. здоровья")
    if i == nil then return nil end
    local spell_description_value = string.sub(spell_description, i, j)
    local a, b = string.find(spell_description_value, "%d+")
    if a == nil then return nil end
    local raw_value = tonumber(string.sub(spell_description_value, a, b))
    return raw_value * (1 + mastery / 100) -- возврат функции с посчитаной мастери до ед.
end

--#endregion

--#region HealValue
local GCD = UpdateLastGCD() -- где эта функция, он к ней обращается !И нужна ли она?
local HMod = 1.10           -- модификатор усиления (для меньшего оверхила)
local HS = GetSpellHValue(20473) * HMod * 1.90 *
    ((GetBuffRemainTime("player", "Свет восходящего солнца", 1) > 0) and 3 or 1)
local WoG = GetSpellHValue(85673) * HMod * 1.30
local LoD = GetSpellHValue(85222) * HMod * 1.15
local HL = GetSpellHValue(82326) * HMod * 1.25
local FoL = GetSpellHValue(19750) * HMod * 1.00
local HPAE = GetSpellHValue(114165) * HMod * 1.00
local HPST = GetSpellHValue(114165) * HMod * 1.25
--#endregion
