include('organizer-lib')
include('commands.lua')
include('flags.lua')
include('spells.lua')
include('lib.lua')

function self_command(command)
  if command == 'ToggleWeapon' then 
    local new_index = sets.weapon.current + 1;
    if #sets.weapon.indices < new_index then
      sets.weapon.current = 1
    else
      sets.weapon.current = new_index
    end
    tellMe('Weapon Set: ' .. sets.weapon.indices[sets.weapon.current])
    equip(sets.weapon[sets.weapon.indices[sets.weapon.current]])
  end
end

function get_sets()
  include('./sets/COR/sets.lua')

  windower.register_event('zone change', function (newId, oldId) 
    if newId == 256 or newId == 257 then
      tellMe('In Adoulin - equip run speed up')
      equip({
        body = "Councilor's Garb",
        hands = "Councilor's Cuffs"
      })
    end
  end)

  send_command:schedule(1, "input //org organize")
  send_command:schedule(3, "input /lockstyleset 4")
  send_command:schedule(10, "input //gs validate")
end

function buff_change(n, gain, buff_table)
end

function IdleState()
  equip(sets.idle)
end

function EngagedState()
  equip(sets.tp.normal)
end

function ac_Global()
  if player.status == 'Engaged' then
      EngagedState()
  else
      IdleState()
  end
end

function pc_JA(spell)
  if spell.type == 'CorsairRoll' or spell.english == 'Double-Up' then
    equip(sets.roll)
  end

  if spell.action_type == 'Ranged Attack' then
    equip(sets.rng.snapshot)
  end

  if spell.type == 'WeaponSkill' then
    if spell.english == 'Leaden Salute' then
      equip(sets.ws.leadenSalute)
    elseif spell.english == 'Wildfire' then
      equip(sets.ws.wildfire)
    elseif spell.english == 'Last Stand' then
      equip(sets.ws.lastStand)
    elseif spell.english == 'Savage Blade' then
      equip(sets.ws.savage)
    end
  end
end

function pc_Magic(spell)
end

function mc_JA(spell)
  if spell.action_type == 'Ranged Attack' then
    equip(sets.rng.atk)
  end
end

function mc_Magic(spell, act)
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