function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','FullAcc')
	state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None', 'Weak', 'SingleWield')

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	-- Additional local binds
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {}
	sets.buff['Chain Affinity'] = {}
	sets.buff.Diffusion = {}
	sets.buff.Efflux = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {}

	-- Fast cast sets for spells

	sets.precast.FC = {
		head = 'Herculean Helm',
		ear1 = 'Etiolation Earring',
		body = gear.jhakri.body,
		hands = gear.jhakri.hands,
		ring1 = "Kishar Ring",
		ring2 = "Naji's Loop",
		legs = "Lengo Pants",
		feet = "Amalric Nails +1",
	}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {

	}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Midcast Sets
	sets.midcast.FastRecast = sets.precast.FC

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {}

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {
		ammo = "Ombre Tathlum +1",
		head = empty,
		neck = "Sanctity Necklace",
		ear1 = "Regal Earring",
		ear2 = "Friomisi Earring",
		body = "Cohort Cloak +1",
		hands = "Amalric Gages +1",
		ring1 = "Metamor. Ring +1",
		waist = "Eschan Stone",
		legs = "Amalric Slops +1",
		feet = "Amalric Nails +1",
	}

	sets.midcast['Enfeebling Magic'] = {}

	sets.midcast['Dark Magic'] = {}

	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast['Elemental Magic'] = {}

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {ring2="Weatherspoon Ring"}

	sets.midcast.Cure = {}

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {}

	sets.midcast['Blue Magic'].SkillBasedBuff = {}

	sets.midcast['Blue Magic'].Buff = {}

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Magus Bazubands"}

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		main = "Bolelabunga",
		sub = "Genmei Shield",
		head = "Blistering Sallet +1",
		neck = "Loricate Torque +1",
		ear1 = "Etiolation Earring",
		ear2 = "Odnowa Earring +1",
		body = gear.jhakri.body,
		hands = "Herculean Gloves",
		ring1 = "Defending Ring",
		ring2 = "Warden's Ring",
		legs = "Rawhide Trousers",
		feet = "Malignance Boots",
	}

	sets.idle.PDT = set_combine(sets.idle, {
		legs = "Malignance Tights",
	})

	sets.Kiting = {legs="Carmine Cuisses +1"}

	-- Extra Melee sets.  Apply these on top of melee sets.
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Weak = {main="Wax Sword", sub="Genmei Shield"}
	sets.weapons.SingleWield = {main="Naegling", sub="Genmei Shield"}

	-- Engaged sets

	sets.engaged = {
		head = "Adhemar Bonnet +1",
		neck = "Sanctity Necklace",
		ear1 = "Crep. Earring",
		ear2 = "Dedition Earring",
		body = "Malignance Tabard",
		hands = "Adhemar Wrist. +1",
		ring1 = "Epona's Ring",
		ring2 = "Ilabrat Ring",
		waist = "Windbuffet Belt +1",
		legs = "Samnuha Tights",
		feet = "Malignance Boots",
	}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(4, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 2)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 2)
	elseif player.sub_job == 'RUN' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'THF' then
		set_macro_page(2, 2)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 2)
	else
		set_macro_page(6, 2)
	end
end
function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 1')
	end
end