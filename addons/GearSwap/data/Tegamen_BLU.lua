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
  if command == 'ToggleTH' then
    if THMode == true then
      THMode = false
      tellMe('THMode is now off')
    else
      THMode = true
      tellMe('THMode is now on')
    end
  end

  if command == 'ToggleAcc' then 
    local new_index = sets.tp.current + 1;
    if #sets.tp.indices < new_index then
      tellMe('Accuracy Set: normal')
      sets.tp.current = 1
    else
      tellMe('Accuracy Set: ' .. sets.tp.indices[new_index])
      sets.tp.current = new_index
    end
    equip(sets.tp[sets.tp.indices[sets.tp.current]])
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
  include('./sets/BLU/sets.lua')

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
  send_command:schedule(3, "input /lockstyleset 1")
  send_command:schedule(5, "input //org organize")
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
        equip(sets.tp[sets.tp.indices[sets.tp.current]])
      end
    end
  end
end

function IdleState()
  if DTMode == true then
    if THMode == true then
      equip(set_combine(sets.dt, { 
        head = "Wh. Rarab Cap +1",
      }))
    else
      equip(set_combine(sets.idle, sets.dt))
    end
  else
    if THMode == true then
      equip(set_combine(sets.idle, { 
        head = "Wh. Rarab Cap +1",
      }))
    else
      equip(sets.idle)
    end
  end
end

function EngagedState()
  local dtStatus = 'OFF'

  if DTMode == true then
    dtStatus = 'ON'
    equip(set_combine(sets.tp[sets.tp.indices[sets.tp.current]], sets.dt))
  else
    if sets.th_active == true then
      tellMe('Switching to TP/TH set')
      equip(set_combine(sets.tp[sets.tp.indices[sets.tp.current]], {
        head = "Wh. Rarab Cap +1",
      }))
    else
      equip(sets.tp[sets.tp.indices[sets.tp.current]])
    end
  end


  tellMe('Switching to TP Set - AccuracyLv: ' .. sets.tp.indices[sets.tp.current] .. ' DT: ' .. dtStatus)
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
		if spell.english == 'Chant du Cygne' then
      equip(sets.cdc_vorpal)
    elseif spell.english == 'Vorpal Blade' then
      equip(sets.cdc_vorpal)
    elseif spell.english == 'Requiescat' then
      equip(sets.requiescat)
    elseif spell.english == 'Realmrazer' then
      equip(sets.cdc_vorpal)
    elseif spell.english == 'Savage Blade' then
      if player.tp >= 1750 then
        equip(set_combine(sets.savage_expiacion, {
          left_ear = 'Mache Earring +1'
        }))
      else
        equip(sets.savage_expiacion)
      end
    elseif spell.english == 'Sanguine Blade' then
      equip(sets.sanguine)
    elseif spell.english == 'Expiacion' then
      if player.tp >= 2750 then
        equip(set_combine(sets.savage_expiacion, {
          left_ear = 'Mache Earring +1'
        }))
      else
        equip(sets.savage_expiacion)
      end
    elseif spell.english == 'Black Halo' then
      if player.tp >= 2750 then
        equip(set_combine(sets.savage_expiacion, {
          left_ear = 'Mache Earring +1'
        }))
      else
        equip(sets.savage_expiacion)
      end
    end
  end

  if spell.english == 'Chain Affinity' then
    equip({ 
      head = 'Hashishin Kavuk +1',
      feet = 'Assim. Charuqs +2'
    })
  end
end

function pc_Magic(spell)
  if spell.skill == 'Blue Magic' then
    if spell.english == "Mighty Guard" then
      tellMe('Mighty Guard override')
      equip(set_combine(sets.fastcast, { feet = 'Luhlaza Charuqs'}))
    else
      equip(set_combine(sets.fastcast, {
        body = 'Hashishin Mintan +1'
      }))
    end
  else
    equip(sets.fastcast)
  end

end

function mc_JA()
end

function mc_Magic(spell, act)
  if spell.skill == 'Blue Magic' then
    if spells.blueMagic.nukes:contains(spell.english) then
      if buffactive['Burst Affinity'] then
        baGear = { 
          legs = "Assim. Shalwar +2",
          feet = "Hashi. Basmak +1"
        };
        if spell.english == "Tenebral Crush" then
          equip(set_combine(sets.magic.nuke, baGear, { 
            head = "Pixie Hairpin +1" 
          }))
        else
          equip(set_combine(sets.nuke, baGear))
        end
      else
        if spells.blueMagic.acc:contains(spell.english) then
          equip(sets.magic.acc)
        else
          if spell.english == "Tenebral Crush" then
            equip(set_combine(sets.magic.nuke, { head = "Pixie Hairpin +1" }))
          else
            equip(sets.magic.nuke)
          end
        end
      end
    elseif spells.blueMagic.physical:contains(spell.english) then
      if buffactive['Chain Affinity'] then
        equip(set_combine(sets.magic.blu_phys, { 
          head = 'Hashishin Kavuk +1',
          feet = 'Assim. Charuqs +2'
        }))
      else
        equip(sets.magic.blu_phys)
      end
    elseif spells.blueMagic.buffs:contains(spell.english) then
      if spell.english == "Mighty Guard" or buffactive['Diffusion'] then
        equip(set_combine(sets.magic.blu_mag_skill, { feet = 'Luhlaza Charuqs'}))
      else
        equip(sets.blu_mag_skill)
      end
    end
  end
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