-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal')
    state.IdleMode:options('Normal','PDT')
	state.Weapons:options('None','Trial')

    gear.perp_staff = {}
	
    send_command('bind @` input /ja "Release" <me>;input /macro book 18;wait 1;input /macro set 1')
	send_command('bind !` input /ja "Assault" <t>')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	
    select_default_macro_book()
end

function user_job_lockstyle()
    windower.chat.input('/lockstyleset 6')
end

function user_job_self_command(commandArgs, eventArgs)
    local cmd = commandArgs[1];

    if cmd == 'FullBuff' then
    end

    if cmd == 'Rebuff' then
    end

    if cmd == 'CrowdControl' then
        return send_command('input /shocksquall')
    end

    if cmd == 'Nuke1' then
        send_command('input /thunderspark')
    end

    if cmd == 'Nuke2' then
        return send_command('gs c elemental helix')
    end
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    sets.weapons.Trial = { main = "Scepter Staff", sub = "Dilet.'s Grip +1" }
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {}
    
    sets.precast.JA['Elemental Siphon'] = {}

    sets.precast.JA['Mana Cede'] = {}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
        main = "Espiritus",
        head = "Beckoner's Horn +1",
        neck = "Incanter's Torque",
        hands = "Con. Bracers +1",
        body = "Con. Doublet +1",
        legs = "Glyphic Spats +1",
        back = "Conveyance Cape",
    }
		
    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head = "Nahtirah Hat",
        body = gear.inyanga.body,
        ear1 = "Etiolation Earring",
        ear2 = "Malignance Earring",
        ring1 = "Weather. Ring",
        ring2 = "Kishar Ring",
        waist = "Embla Sash",
        legs = "Lengo Pants",
        feet = "Regal Pumps +1",
    }

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {})       
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {}
	
    sets.midcast.Cure = {}
		
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

	sets.midcast['Summoning Magic'] = {}
		
	sets.midcast['Elemental Magic'] = {}
		
	sets.midcast['Elemental Magic'].Resistant = {}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {}
		
	sets.midcast.Impact = {}
		
	sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {})

    sets.midcast['Divine Magic'] = {}
		
    sets.midcast['Dark Magic'] = {}
	
	sets.midcast.Drain = {}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {}
		
    sets.midcast.Stun.Resistant = {}
		
	sets.midcast['Enfeebling Magic'] = {}
		
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {
        main = "Espiritus",
        grip = "Vox Grip",
        head = "Beckoner's Horn +1",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        hands = gear.inyanga.hands,
        back = "Conveyance Cape",
        feet = "Apogee Pumps +1",
    }

    sets.midcast.Pet.DebuffBloodPactWard = sets.midcast.Pet.BloodPactWard
    sets.midcast.Pet.PhysicalBloodPactRage = {
        main = "Gridarvor",
        sub = "Elan Strap",
        ammo = "Epitaph",
        head = "Apogee Crown +1",
        neck = "Shulmanu Collar",
        ear1 = "Gelos Earring",
        body = "Apo. Dalmatica +1",
        ring1 = "Varar Ring +1",
        ring2 = "Varar Ring +1",
        back = "Scintillating Cape",
        waist = "Klouskap Sash +1",
        legs = "Apogee Slacks +1",
        feet = "Apogee Pumps +1",
    }
    sets.midcast.Pet.MagicalBloodPactRage = {
        main = "Espiritus",
        sub = "Elan Strap",
        ammo = "Epitaph",
        head = "Apogee Crown +1",
        neck = "Adad Amulet",
        ear1 = "Gelos Earring",
        body = "Apo. Dalmatica +1",
        ring1 = "Varar Ring +1",
        ring2 = "Varar Ring +1",
        back = "Scintillating Cape",
        waist = "Regal Belt",
        legs = "Enticer's Pants",
        feet = "Apogee Pumps +1",
    }
    
    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"
	sets.midcast.Pet['Impact'] = sets.midcast.Pet.DebuffBloodPactWard
	sets.midcast.Pet['Flaming Crush'] = {
        main = "Espiritus",
        sub = "Elan Strap",
        ammo = "Epitaph",
        neck = "Adad Amulet",
        ear1 = "Gelos Earring",
        body = "Apo. Dalmatica +1",
        ring1 = "Varar Ring +1",
        ring2 = "Varar Ring +1",
        waist = "Regal Belt",
    }
    sets.midcast.Pet['Burning Strike'] = sets.midcast.Pet['Flaming Crush']
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {
        main = "Malignance Pole",
        sub = "Mensch Strap",
        head = "Beckoner's Horn +1",
        neck = "Loricate Torque +1",
        ear1 = "Etiolation Earring",
        ear2 = "Odnowa Earring +1",
        body = "Apo. Dalmatica +1",
        hands = "Amalric Gages +1",
        ring1 = "Gleatinous Ring",
        waist = "Fucho-no-obi",
        legs = "Assid. Pants +1",
        feet = "Nyame Sollerets",
    }

    sets.idle.PDT = sets.idle;
		
    sets.idle.Avatar = set_combine(sets.idle, {
        main = "Gridarvor",
        ammo = "Epitaph",
        neck = "Caller's Pendant",
        waist = "Isa Belt",
        feet = "Apogee Pumps +1",
    });
    sets.idle.PDT.Avatar = set_combine(sets.idle.PDT, {
        main = "Gridarvor",
        ammo = "Epitaph",
        waist = "Isa Belt",
        feet = "Apogee Pumps +1",
    })
    sets.idle.Spirit = sets.idle.Avatar
    sets.idle.PDT.Spirit = sets.idle.PDT.Avatar
		
    sets.idle.Avatar.Engaged = sets.idle.Avatar
        
    sets.perp = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

    -- Defense sets
    sets.defense.PDT = sets.idle.PDT
    sets.defense.MDT = sets.idle.PDT
    sets.defense.MEVA = sets.idle.PDT
		
    sets.Kiting = {}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.TPEat = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}

	-- Weapons sets

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {
        head = "Blistering Sallet +1",
        neck = 'Sanctity Necklace',
        ear1 = 'Mache Earring +1',
        ear2 = 'Brutal Earring',
        body = gear.jhakri.body,
        hands = gear.jhakri.hands,
        ring1 = 'Petrov Ring',
        ring2 = 'Rajas Ring',
        waist = 'Windbuffet Belt +1',
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets",
    }
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 18)
end