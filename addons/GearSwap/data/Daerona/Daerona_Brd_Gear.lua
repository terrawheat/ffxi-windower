function user_job_setup()
	autows = 'Evisceration'
	-- Options: Override default values
	state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal','Resistant','AoE')
	state.IdleMode:options('Normal','DT')
	state.Weapons:options('None')

	-- Adjust this if using the Terpander (new +song instrument)
	info.ExtraSongInstrument = 'Terpander'
	-- How many extra songs we can keep from Daurdabla/Terpander
	info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
	state.UseCustomTimers = M(true, 'Use Custom Timers')
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ExtraSongsMode')

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
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
		range = "Linos",
		head = "Vanya Hood",
		body = gear.inyanga.body,
		waist = "Embla Sash",
		legs = "Orvail Pants +1",
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		ring2 = "Lebeche Ring",
		legs = "Vanya Slops",
		feet = "Vanya Clogs",
	})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.BardSong =  set_combine(sets.precast.FC, {
		feet = 'Telchine Pigaches',
	})

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{}) --range="Gjallarhorn"
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{}) --range="Blurred Harp +1"
	sets.precast.FC.Lullaby = {} --range="Gjallarhorn"
	sets.precast.FC.Lullaby.Resistant = {} --range="Blurred Harp +1"
	sets.precast.FC['Horde Lullaby'] = {} --range="Gjallarhorn"
	sets.precast.FC['Horde Lullaby'].Resistant = {} --range="Blurred Harp +1"
	sets.precast.FC['Horde Lullaby'].AoE = {} --range="Blurred Harp +1"
	sets.precast.FC['Horde Lullaby II'] = {} --range="Gjallarhorn"
	sets.precast.FC['Horde Lullaby II'].Resistant = {} --range="Blurred Harp +1"
	sets.precast.FC['Horde Lullaby II'].AoE = {} --range="Blurred Harp +1"
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong, {}) --range="Gjallarhorn"
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {} -- feet="Bihu Slippers"
	sets.precast.JA.Troubadour = {} -- body="Bihu Jstcorps +1"
	sets.precast.JA['Soul Voice'] = {} -- legs="Bihu Cannions +1"

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}
		
	-- Swap to these on Moonshade using WS if at 3000 TP

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = sets.precast.FC

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {} -- legs="Fili Rhingrave +1"
	sets.midcast.Lullaby = {} -- range="Gjallarhorn"
	sets.midcast.Lullaby.Resistant = {} -- range="Blurred Harp +1"
	sets.midcast['Horde Lullaby'] = {} -- range="Gjallarhorn"
	sets.midcast['Horde Lullaby'].Resistant = {} -- range="Blurred Harp +1"
	sets.midcast['Horde Lullaby'].AoE = {} -- range="Blurred Harp +1"
	sets.midcast['Horde Lullaby II'] = {} -- range="Gjallarhorn"
	sets.midcast['Horde Lullaby II'].Resistant = {} -- range="Blurred Harp +1"
	sets.midcast['Horde Lullaby II'].AoE = {} -- range="Blurred Harp +1"
	sets.midcast.Madrigal = {}
	sets.midcast.Mambo = {}
	sets.midcast.Scherzo = {}
	sets.midcast.Carol = {}
	sets.midcast.Etude = {}
	sets.midcast.Paeon = {}
	sets.midcast.March = {}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March, {})
	sets.midcast.Minuet = {}
	sets.midcast.Minne = {}
	sets.midcast["Sentinel's Scherzo"] = {}
	sets.midcast['Magic Finale'] = {} -- range="Blurred Harp +1"
	sets.midcast.Mazurka = {} -- range="Gjallarhorn"
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {
		main = "Kali",
		range = "Linos",
		legs = gear.inyanga.legs,
	}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {
	}
		
	sets.midcast.SongDebuff.DW = {}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {
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
		ear1 = "Gifted Earring",
		hands = "Weath. Cuffs +1",
		ring1 = "Janniston Ring",
		ring2 = "Lebeche Ring",
		legs = "Vanya Slops",
		feet = "Vanya Clogs",
	}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
		
	sets.midcast['Enhancing Magic'] = {
		waist = "Embla Sash",
	}
		
	sets.midcast.Stoneskin = sets.midcast['Enhancing Magic']
		
	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast['Elemental Magic'].Resistant = {}
		
	sets.midcast.Cursna =  {
	}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	-- Resting sets
	sets.resting = {}
	
	sets.idle = {
		range = "Linos",
	}
		
	sets.idle.NoRefresh = sets.idle

	sets.idle.DT = sets.idle
	
	-- Defense sets

	sets.defense.PDT = sets.idle

	sets.defense.MDT = sets.idle

	sets.Kiting = {}
	sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 6')
	end
end