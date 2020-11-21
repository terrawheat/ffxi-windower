include('organizer-lib')
include('commands.lua')
include('flags.lua')
include('spells.lua')
include('lib.lua')

function self_command(command)
  if command == 'ToggleDT' then
    if DTMode == true then
      DTMode = false
      tellMe('DTMode is now off')
    else
      DTMode = true
      tellMe('DTMode is now on')
    end
  end
end

function get_sets()
  include('./sets/GEO/sets.lua')

  windower.register_event('zone change', function (newId, oldId) 
    if newId == 256 or newId == 257 then
      tellMe('In Adoulin - equip run speed up')
      equip({
        body = "Councilor's Garb",
        hands = "Councilor's Cuffs"
      })
    end
  end)

  send_command:schedule(1, "input //gs org")
  send_command:schedule(3, "input /lockstyleset 3")
  send_command:schedule(5, "input //org organize")
  send_command:schedule(10, "input //gs validate")
end

function buff_change(n, gain, buff_table)
end

function IdleState()
  if pet.isvalid == true then
    if DTMode == true then
      tellMe('Equipping Idle with Luopan stats and DT')
      equip(sets.idle.luo_active_dt)
    else
      tellMe('Equipping Idle with Luopan stats')
      equip(sets.idle.luo_active)
    end
  else
    if DTMode == true then
      tellMe('Equipping Idle with Refresh/Regen and DT')
      equip(set_combine(sets.idle.no_luopan, sets.dt))
    else
      tellMe('Equipping Idle with Refresh/Regen')
      equip(sets.idle.no_luopan)
    end
  end
end

function EngagedState()
  equip(sets.tp)
end

function ac_Global()
  if player.status == 'Engaged' then
      EngagedState()
  else
      IdleState()
  end
end

function pc_JA(spell)
  if spell.english == 'Radial Arcana' then
    equip(sets.ja.radial_arcana);
  elseif spell.english == 'Bolster' then
    equip(sets.ja.bolster)
  elseif spell.english == 'Life Cycle' then
    equip(sets.ja.life_cycle)
  end
end

function pc_Magic(spell)
  if spell.type == 'WhiteMagic' then
    equip(sets.precast.cure)
  elseif spell.type == 'BlackMagic' then
    equip(sets.precast.nuke)
  elseif spell.type == 'EnfeeblingMagic' then
    equip(sets.precast.debuff)
  else
    equip(sets.precast.base)
  end
end

function mc_JA()
end

function mc_Magic(spell, act)
  if string.find(spell.english, 'Drain') or string.find(spell.english, 'Aspir') then
    equip(sets.nuke.dark)
  elseif string.find(spell.english, 'Regen') then
    equip(sets.cure.regen)
  elseif string.find(spell.english, 'Indi-') or string.find(spell.english, 'Geo-') then
    equip(set_combine(sets.geo_skill))
  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.debuff.base)
  elseif spell.type == 'WhiteMagic' then
    equip(sets.cure.mid)
  elseif spell.skill == 'Elemental Magic' and spell.mp_cost <= 37 then
    tellMe('FreeNuke situation detected - raising Magic Damage')
    equip(sets.nuke.free_nuke)
  else
    equip(sets.nuke.base)
  end
end

function status_change(new, old)
  if new == 'Idle' then
    IdleState()
  elseif new == 'Engaged' then
    EngagedState()
  end
end

function precast(spell, act)
  if spell.action_type == 'Ability' then 
    pc_JA(spell, act)
  elseif spell.action_type == 'Magic' then
    pc_Magic(spell, act)
  end
end

function midcast(spell, act)
  if spell.action_type == 'Ability' then
    mc_JA(spell, act)
  elseif spell.action_type == 'Magic' then 
    mc_Magic(spell, act)
  end
end

function aftercast(spell, act, spellMap, eventArgs)
  if spell.type == 'WeaponSkill' then
    tellMe('TP Return: {' .. player.tp .. '}')
  end
  ac_Global(spell)
end