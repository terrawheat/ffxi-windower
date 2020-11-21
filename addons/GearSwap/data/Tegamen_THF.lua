include('organizer-lib')
include('commands.lua')
include('flags.lua')
include('spells.lua')
include('lib.lua')

function self_command(command)
  if command == 'ToggleDT' then
    if DTMode == true then
      DTMode = false
      equip(sets.tp)
      tellMe('DTMode is now off')
    else
      DTMode = true
      equip(set_combine(sets.tp, sets.dt))
      tellMe('DTMode is now on')
    end
  end

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
  include('./sets/THF/sets.lua')

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
  send_command:schedule(3, "input /lockstyleset 2")
  send_command:schedule(10, "input //gs validate")
end

function buff_change(n, gain, buff_table)
  local name
  name = string.lower(n)
  if S{"terror","petrification","sleep","stun"}:contains(name) then
    if gain then
      tellMe('Incapacitation occurred... switching to DT.')
      equip(sets.dt)
    elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
      if player.status == 'Engaged' then
        tellMe('Incapacitation lifted... back to normal')
        equip(sets.tp)
      end
    end
  end
end

function IdleState()
  if DTMode == true then
    equip(set_combine(sets.dt, { 
      head = "Wh. Rarab Cap +1",
      feet = "Skulker's Poulaines"
    }))
  else
    equip(set_combine(sets.idle, { 
      head = "Wh. Rarab Cap +1",
      feet = "Skulker's Poulaines"
    }))
  end
end

function EngagedState()
  if DTMode == true then
    tellMe('Switching to TP with DT set')
    equip(set_combine(sets.tp, sets.dt))
  else
    if sets.th_active == true then
      tellMe('Switching to TP/TH set')
      equip(sets.tp_th)
    else
      if buffactive['Conspirator'] then
        tellMe('Switching to TP set with Conspirator gear')
        equip(set_combine(sets.tp, {
          body = "Skulker's Vest",
        }));
      else
        tellMe('Switching to TP set')
        equip(sets.tp)
      end
    end
  end
end

function ac_Global()
  if player.status == 'Engaged' then
      EngagedState()
  else
      IdleState()
  end
end

function pc_JA(spell)
  if spell.type == 'WeaponSkill' then
    if spell.english == 'Evisceration' then
      if buffactive['Trick Attack'] then
        equip(sets.evisceration, { hands = "Pill. armlets +1"})
      elseif buffactive['Sneak Attack'] then
        equip(sets.evisceration, { hands = "Skulker's Armlets"})
      else
        equip(sets.evisceration)
      end
    elseif spell.english == 'Mandalic Stab' or spell.english == "Rudra's Storm" then
      if buffactive['Trick Attack'] then
        equip(sets.mandalic_rudra, { hands = "Pill. armlets +1"})
      elseif buffactive['Sneak Attack'] then
        equip(sets.mandalic_rudra, { hands = "Skulker's Armlets"})
      else
        equip(sets.mandalic_rudra)
      end
    elseif spell.english == 'Exenterator' then
      if buffactive['Trick Attack'] then
        equip(sets.exenterator, { hands = "Pill. armlets +1"})
      elseif buffactive['Sneak Attack'] then
        equip(sets.exenterator, { hands = "Skulker's Armlets"})
      else
        equip(sets.exenterator)
      end
    end
  end

  if spell.english == 'Flee' then
    equip({ feet = 'Pill. Poulaines +1' })
  end

  if spell.english == 'Hide' then
    equip({ body = 'Pillager\'s Vest +1' })
  end
  
  if spell.english == 'Despoil' then
    equip({ 
      body = "Skulker's Culottes",
      feet = "Skulker's Poulaines"
    })
  end

  if spell.english == 'Steal' then
    equip({ 
      hands = 'Pill. Armlets +1',
      legs = 'Pill. Culottes +1',
      feet = 'Pill. Poulaines +1'
    })
  end
end

function pc_Magic(spell)
end

function mc_JA()
end

function mc_Magic(spell, act)
end

function status_change(new, old)
  if new == 'Idle' then
    if old == 'Engaged' then
      sets.th_active = true
    end
    IdleState()
  elseif new == 'Engaged' then
    EngagedState()
    if old == 'Idle' then
      sets.th_active = false
    end
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