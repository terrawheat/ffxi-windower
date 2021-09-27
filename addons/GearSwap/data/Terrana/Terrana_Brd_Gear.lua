function user_job_setup()
	autows = 'Evisceration'
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc','DomainInvasion')
	state.CastingMode:options('Normal','Resistant','AoE')
	state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','DomainInvasion')

	-- Adjust this if using the Terpander (new +song instrument)
	info.ExtraSongInstrument = 'Blurred Harp +1'
	-- How many extra songs we can keep from Daurdabla/Terpander
	info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
	state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function user_job_self_command(commandArgs, eventArgs)
	local cmd = commandArgs[1];

	if cmd == 'FullBuff' then
			windower.add_to_chat(127, 'Performing full buff...')
			return send_command('exec brd/start.txt')
	end

	if cmd == 'Rebuff' then
			windower.add_to_chat(127, 'Performing full buff...')
			return send_command('exec brd/rebuff.txt')
	end

	if cmd == 'CrowdControl' then
		send_command('input /ma "Horde Lullaby II" <t>')
	end
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.DomainInvasion = {main="Skinflayer",sub="Voluspa Knife"}

	sets.buff.Sublimation = {}
	sets.buff.DTSublimation = {}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
		main = 'Kali',
		sub = 'Culminus',
		head = 'Nahtirah Hat',
		ear2 = 'Etiolation Earring',
		body = gear.inyanga.body,
		hands = 'Gende. Gages +1',
		ring1 = 'Kishar Ring',
		ring2 = 'Weather. Ring',
		waist = 'Embla Sash',
		legs = gear.ayanmo.legs,
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		feet = 'Vanya Clogs',
		back = "Disperser's Cape",
	})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.BardSong = {
		range = 'Gjallarhorn',
		head = 'Fili Calot +1',
		ear1 = "Aoidos' Earring",
		feet = 'Telchine Pigaches',
	}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby = {range="Gjallarhorn"}
	sets.precast.FC.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'] = {range="Gjallarhorn"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'] = {range="Gjallarhorn"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Gjallarhorn"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {} -- body="Bihu Jstcorps +1"
	sets.precast.JA['Soul Voice'] = {} -- legs="Bihu Cannions +1"

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = sets.precast.FC

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {range="Gjallarhorn"}
	sets.midcast.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'] = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'] = {range="Gjallarhorn"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Mambo = {feet = 'Mousai Crackows',}
	sets.midcast.Scherzo = {feet = 'Fili Cothurnes +1'}
	sets.midcast.Carol = {head = 'Mousai Gages'}
	sets.midcast.Etude = {head = 'Mousai Turban'}
	sets.midcast.Paeon = {range='Blurred Harp +1',legs = 'Brioso Roundlet +1'}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {range="Blurred Harp +1"}
	sets.midcast.Mazurka = {range="Gjallarhorn"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
		main = 'Kali',
		head = 'Fili Calot +1',
		neck = 'Moonbow Whistle',
		hands = 'Fili Manchettes +1',
		body = "Fili Hongreline +1",
		legs = gear.inyanga.legs,
		feet = 'Brioso Slippers +2'
	}
		
	sets.midcast.SongEffect.DW = {main="Kali",sub="Kali"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
		head = gear.inyanga.head,
		hands = gear.inyanga.hands,
		body = gear.inyanga.body,
		feet = gear.inyanga.feet,
		legs = gear.inyanga.legs,
	}
		
	sets.midcast.SongDebuff.DW = {main="Kali",sub="Kali"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {
		head = gear.inyanga.head,
		hands = gear.inyanga.hands,
		body = gear.inyanga.body,
		feet = gear.inyanga.feet,
		legs = gear.inyanga.legs,
	}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {}
		
	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
	sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {
		main = 'Iridal Staff',
		sub = 'Enki Strap',
		head = "Vanya Hood",
		body = "Vanya Robe",
		hands = 'Vanya Cuffs',
		waist = 'Hachirin-no-Obi',
		legs = 'Vanya Slops',
		feet = 'Vanya Clogs',
	}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
		
	sets.midcast['Enhancing Magic'] = {
		feet = 'Telchine Pigaches',
	}
		
	sets.midcast.Stoneskin = sets.midcast['Enhancing Magic']
		
	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast['Elemental Magic'].Resistant = {}
		
	sets.midcast.Cursna =  {
		feet = 'Vanya Clogs',
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	-- Resting sets
	sets.resting = {}
	
	sets.idle = {
		main = 'Kali',
		sub = 'Culminus',
		head = gear.inyanga.head,
		body = gear.inyanga.body,
		hands = 'Gende. Gages +1',
		legs = gear.ayanmo.legs,
		waist = "Fucho-no-Obi",
		feet = 'Fili Cothurnes +1',
		ear1 = 'Infused Earring',
		ear2 = 'Etiolation Earring',
		ring1 = 'Inyanga Ring',
		ring2 = "Warden's Ring",
		back = "Intarabus's Cape"
	}
		
	sets.idle.NoRefresh = sets.idle

	sets.idle.DT = sets.idle
	
	-- Defense sets

	sets.defense.PDT = sets.idle

	sets.defense.MDT = sets.idle

	sets.Kiting = {feet="Fili Cothurnes +1"}
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
		head = gear.ayanmo.head,
		hands = gear.ayanmo.hands,
		body = gear.ayanmo.body,
		feet = gear.ayanmo.feet,
		legs = gear.ayanmo.legs,
		waist = 'Sailfi belt +1',
		ear1 = 'Brutal Earring',
		ear2 = 'Etiolation Earring',
		back = 'Bleating Mantle',
		ring1 = 'Rajas Ring',
		neck = 'Sanctity Necklace'
	}
	sets.engaged.Acc = {
		head = gear.ayanmo.head,
		hands = gear.ayanmo.hands,
		body = gear.ayanmo.body,
		feet = gear.ayanmo.feet,
		legs = gear.ayanmo.legs,
		waist = 'Sailfi belt +1',
		ear1 = 'Brutal Earring',
		ear2 = 'Etiolation Earring',
		back = 'Bleating Mantle',
		ring1 = 'Rajas Ring',
		neck = 'Sanctity Necklace'
	}
	sets.engaged.DW = {
		head = gear.ayanmo.head,
		hands = gear.ayanmo.hands,
		body = gear.ayanmo.body,
		feet = gear.ayanmo.feet,
		legs = gear.ayanmo.legs,
		waist = 'Sailfi belt +1',
		ear1 = 'Brutal Earring',
		ear2 = 'Eabani Earring',
		back = 'Bleating Mantle',
		ring1 = 'Rajas Ring',
		neck = 'Sanctity Necklace'
	}
	sets.engaged.DW.Acc = {
		head = gear.ayanmo.head,
		hands = gear.ayanmo.hands,
		body = gear.ayanmo.body,
		feet = gear.ayanmo.feet,
		legs = gear.ayanmo.legs,
		waist = 'Sailfi belt +1',
		ear1 = 'Brutal Earring',
		ear2 = 'Eabani Earring',
		back = 'Bleating Mantle',
		ring1 = 'Rajas Ring',
		neck = 'Sanctity Necklace'
	}
	sets.engaged.DomainInvasion = set_combine(sets.engaged, {
		head = 'Angantyr Beret',
		body = 'Angantyr Robe',
		hands = 'Angantyr Mittens',
		legs = 'Angantyr Tights',
		feet = 'Angantyr Boots',
	})
	sets.engaged.DW.DomainInvasion = set_combine(sets.engaged.DW, {
		head = 'Angantyr Beret',
		body = 'Angantyr Robe',
		hands = 'Angantyr Mittens',
		legs = 'Angantyr Tights',
		feet = 'Angantyr Boots',
	})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end