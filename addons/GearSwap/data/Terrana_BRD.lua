include('organizer-lib')
include('commands.lua')
include('flags.lua')
include('spells.lua')
include('lib.lua')

function has_any_buff_of(buff_set)
  for i,v in pairs(buff_set) do
      if buffactive[v] ~= nil then return true end
  end
end

function self_command(command)
  if command == 'ToggleDT' then
    tellMe('DT not implemented')
  end
  if command == 'ToggleTH' then
    tellMe('TH not implemented')
  end
end

function get_sets()
  include('./sets/BRD/sets.lua')

  windower.register_event('zone change', function (newId, oldId) 
    if newId == 256 or newId == 257 then
      tellMe('In Adoulin - equip run speed up')
      equip({
        body = "Councilor's Garb",
        hands = "Councilor's Cuffs"
      })
    end
  end)
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
  if buffactive['Elvorseal'] then
    equip(set_combine(sets.idle, sets.domain_invasion))
  else
    equip(sets.idle)
  end
end

function EngagedState()
  if buffactive['Elvorseal'] then
    tellMe('Switching to TP in DI set')
    equip(set_combine(sets.tp, sets.domain_invasion))
  else
    tellMe('Switching to TP set')
    equip(sets.tp)
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
  end
end

function pc_Magic(spell)
  if spell.skill == 'Singing' then
    if string.find(spell.english, 'Lullaby') then
      equip(set_combine(sets.precast.song, {
        range = 'Blurred Harp +1'
      }))
    else
      equip(sets.precast.song)
    end
  else
    equip(sets.precast.base)
  end
end

function mc_JA()
end

function mc_Magic(spell, act)
  if spell.skill == 'Singing' then
    if string.find(spell.english, 'Ballad') then
      equip(sets.midcast.song.ballad)
    elseif string.find(spell.english, 'Paeon') then
      equip(sets.midcast.song.paeon)
    elseif string.find(spell.english, 'Carol') then
      equip(sets.midcast.song.carol)
    elseif string.find(spell.english, 'Mambo') then
      equip(sets.midcast.song.mambo)
    elseif string.find(spell.english, 'Etude') then
      equip(sets.midcast.song.etude)
    elseif string.find(spell.english, 'Threnody') then
      equip(sets.midcast.song.threnody)
    elseif string.find(spell.english, 'Nocturne') 
      or string.find(spell.english, 'Elegy')
      or string.find(spell.english, 'Requiem')
    then
      equip(sets.midcast.song.debuff)
    elseif string.find(spell.english, 'Lullaby') then
      equip(sets.midcast.song.lullaby)
    elseif string.find(spell.english, 'Scherzo') then
      equip(sets.midcast.song.scherzo)
    else
      equip(sets.midcast.song.base)
    end
  elseif spell.skill == 'Enhancing Magic' then
    if string.find(spell.english, 'Bar') then
      equip(sets.midcast.spell.bar)
    elseif spell.english == 'Aquaveil' then
      equip(sets.midcast.spell.aquaveil)
    else
      equip(sets.midcast.spell.enhancing)
    end
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