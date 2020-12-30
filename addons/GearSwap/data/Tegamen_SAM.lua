include('organizer-lib')
include('commands.lua')
include('flags.lua')
include('spells.lua')
include('lib.lua')

function self_command(command)
  if command == 'ToggleDT' then
    if DTMode == true then
      DTMode = false
      equip(sets.tp[sets.tp.indices[sets.tp.current]])
      tellMe('DTMode is now off')
    else
      DTMode = true
      equip(set_combine(sets.tp[sets.tp.indices[sets.tp.current]], sets.dt))
      tellMe('DTMode is now on')
    end
  end

  if command == 'ToggleAcc' then 
    local new_index = sets.tp.current + 1;
    if #sets.tp.indices < new_index then
      tellMe('Accuracy Set: ' .. sets.tp.indices[1])
      sets.tp.current = 1
    else
      tellMe('Accuracy Set: ' .. sets.tp.indices[new_index])
      sets.tp.current = new_index
    end
    equip(sets.tp[sets.tp.indices[sets.tp.current]])
  end

  if command == 'ToggleTH' then
    if THMode == true then
      THMode = false
      tellMe('THMode is now off')
    else
      THMode = true
      tellMe('THMode is now on')
    end
  end
end

function get_sets()
  include('./sets/SAM/sets.lua')

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
  send_command:schedule(3, "input /lockstyleset 6")
  send_command:schedule(5, "input //org organize")
  send_command:schedule(10, "input //gs validate")
end

function buff_change(n, gain, buff_table)
  local name
  name = string.lower(n)
  if S{"terror","petrification","sleep","stun"}:contains(name) then
    if gain then
      tellMe('Incapacitation occurred... switching to DT.')
      if name == "sleep" then
        equip(set_combine(sets.dt, {
          neck = 'Vim Torque +1'
        }))
      else
        equip(sets.dt)
      end
    elseif not has_any_buff_of({"terror","petrification","sleep","stun"}) then
      if player.status == 'Engaged' then
        tellMe('Incapacitation lifted... back to normal')
        equip(sets.tp[sets.tp.indices[sets.tp.current]])
      end
    end
  end
end

function IdleState()
  equip(sets.idle)
end

function EngagedState()
  local dtStatus = 'OFF'

  if DTMode == true then
    dtStatus = 'ON'
    equip(set_combine(sets.tp[sets.tp.indices[sets.tp.current]], sets.dt))
  else
    equip(sets.tp[sets.tp.indices[sets.tp.current]])
  end

  tellMe('Switching to TP Set - DT: ' .. dtStatus)
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
    if spells.ws.hybrid:contains(spell.english) then
      equip(sets.hybrid_ws)
    else
      if sets.tp.current == 2 then
        equip(sets.ws_acc)
      else
        equip(sets.ws)
      end
    end
  end

  if spell.english == 'Meditate' then
    equip(sets.meditate)
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