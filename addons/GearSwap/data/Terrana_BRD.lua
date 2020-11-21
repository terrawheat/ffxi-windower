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
  equip(sets.idle)
end

function EngagedState()
  tellMe('Switching to TP/TH set')
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
  if spell.type == 'WeaponSkill' then
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