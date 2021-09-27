-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    autows = 'Omniscience'
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'Refresh', 'DynaRP')
    state.HybridMode:options('Normal','PDT')
    state.Weapons:options('None', 'Akademos', 'ClubMelee', 'StaffMelee', 'TwinClub')
    
    -- Ambu Capes
    gear.ambu_FC = { name="Lugh's Cape", augments={'"Fast Cast"+10'}}
    gear.ambu_Nuke = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10'}}

    -- Additional local binds
    send_command('bind ^` gs c cycle ElementalMode')
    send_command('bind @` gs c cycle MagicBurstMode')
    send_command('bind @f10 gs c cycle RecoverMode')
    send_command('bind @f8 gs c toggle AutoNukeMode')
    send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
    send_command('bind ^backspace input /ma "Stun" <t>')
    send_command('bind !` gs c scholar power')
    send_command('bind !backspace gs c scholar speed')
    send_command('bind @backspace gs c scholar aoe')
    
    select_default_macro_book()
end

function user_job_self_command(commandArgs, eventArgs)
    local cmd = commandArgs[1];

    if cmd == 'FullBuff' then
        windower.add_to_chat(127, 'Performing full buff...')
        return send_command('exec sch/FullBuff.txt')
    end

    if cmd == 'Rebuff' then
        windower.add_to_chat(127, 'Performing quickie buff...')
        return send_command('exec sch/Rebuff.txt')
    end

    if cmd == 'CrowdControl' then
        return send_command('exec sch/sleep.txt')
    end

    if cmd == 'Nuke1' then
        send_command('gs c elemental nuke')
    end

    if cmd == 'Nuke2' then
        return send_command('gs c elemental helix')
    end
end

function user_job_post_precast(spell, spellMap, eventArgs)
    if spell.english == 'Impact' then
        equip(sets.precast.Impact)
    end

    if spell.english == 'Dispelga' then
        equip(sets.precast.Dispelga)
    end
end

function user_job_post_midcast(spell, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and (state.Buff['Dark Arts'] or state.Buff['Addendum: Black']) then
        equip(gear.DarkArtsEnfeebling)
    end
end
-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.weapons.Akademos = { main = 'Akademos', sub = 'Enki Strap' }
    sets.weapons.ClubMelee = { main = 'Daybreak', sub = 'Genmei Shield' }
    sets.weapons.TwinClub = { main = 'Daybreak', sub = 'Bolelabunga' }
    sets.weapons.StaffMelee = { main = 'Malignance Pole', sub = "Dilet.'s Grip +1" }
    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +2"}
    sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"}

    -- Fast cast sets for spells

    sets.precast.FC = {
        main = 'Daybreak',
        sub = 'Genmei Shield',
        ammo = "Incantor Stone",
        head = "Nahtirah Hat",
        ear1 = "Malignance Earring",
        ear2 = "Etiolation Earring",
        body = "Shango Robe",
        hands = "Acad. Bracers +3",
        ring1 = "Weather. Ring",
        ring2 = "Kishar Ring",
        back = gear.ambu_FC,
        waist = "Embla Sash",
        legs = "Lengo Pants",
        feet = "Acad. Loafers +3"
    }
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {
        neck = "Nodens Gorget",
        waist = "Siegel Sash",
        legs = "Doyen Pants",
    })

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
        ear2 = "Barkaro. Earring"
    })

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
        ear2 = "Mendi. Earring",
        legs = "Doyen Pants",
        feet = "Vanya Clogs",
    })

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.Impact = set_combine(sets.precast.FC['Elemental Magic'], { head = empty, body = "Twilight Cloak" })
    sets.precast.Dispelga = set_combine(sets.precast.FC, { main = "Daybreak" })

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {
        ammo = "Ghastly Tathlum +1",
        head = "Acad. Mortar. +2",
        neck = "Sanctity Necklace",
        ear1 = "Moonshade Earring",
        ear2 = "Etiolation Earring",
        body = "Acad. Gown +2",
        ring1 = "Mephitas's Ring",
        ring2 = "Mephitas's Ring +1",
        waist = "Shinjutsu-no-Obi +1",
        legs = "Amalric Slops +1",
        feet = "Nyame Sollerets"
    }

    sets.precast.WS.Omniscience = set_combine(sets.midcast['Elemental Magic'], {
        ring2 = "Epaminondas's Ring",
    })

    sets.precast.WS['Shining Strike'] = {
        ammo = "Hydrocera",
        head = gear.jhakri.head,
        neck = "Argute Stole +1",
        ear1 = "Odnowa Earring +1",
        ear2 = "Malignance Earring",
        body = "Peda. Gown +3",
        hands = gear.jhakri.hands,
        ring1 = "Metamor. Ring +1",
        ring2 = "Weather. Ring",
        back = gear.ambu_Nuke,
        waist = "Hachirin-no-Obi",
        legs = gear.jhakri.legs,
        feet = gear.jhakri.feet,
    }

    sets.precast.WS['Seraph Strike'] = sets.precast.WS['Shining Strike']
    sets.precast.WS['Flash Nova'] = sets.precast.WS['Shining Strike']

    -- Midcast Sets

    sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
    
    -- Gear that converts elemental damage done to recover MP.	
    sets.RecoverMP = {}
    
    -- Gear for Magic Burst mode.
    sets.MagicBurst = {
        head = "Merlinic Hood",
        body = "Merlinic Jubbah",
        ring1 = "Locus Ring",
        ring2 = "Mujin Band"
    }
    sets.HelixMagicBurst = {
        head = "Merlinic Hood",
        body = "Merlinic Jubbah",
        ring2 = "Mujin Band"
    }
    
    -- Gear for specific elemental nukes.
    sets.element.Dark = { head = 'Pixie Hairpin +1', ring2 = 'Archon Ring' }
    sets.element.Light = { ring2 = "Weather. Ring" }

    sets.midcast.FastRecast = sets.precast.FC
        
    sets.midcast.Cure = {
        main = "Daybreak",
        sub = "Genmei Shield",
        ammo = "Ombre Tathlum +1",
        head = "Vanya Hood",
        neck = "Incanter's Torque",
        ear1 = "Magnetic Earring",
        ear2 = "Mendi. Earring",
        body = "Peda. Gown +3",
        hands = "Peda. Bracers +1",
        ring1 = "Lebeche Ring",
        ring2 = "Naji's Loop",
        back = "Thauma. Cape",
        waist = "Embla Sash",
        legs = "Acad. Pants +3",
        feet = "Vanya Clogs",
    }
        
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {
        main = "Iridal Staff",
        sub = "Enki Strap",
        waist = "Hachirin-no-Obi",
    })
    sets.midcast.LightDayCure = set_combine(sets.midcast.Cure, {
        main = "Iridal Staff",
        sub = "Enki Strap",
        waist = "Hachirin-no-Obi",
    })

    sets.midcast.Curaga = sets.midcast.Cure

    sets.Self_Healing = {}
    sets.Cure_Received = {}
    sets.Self_Refresh = {}
    
    sets.midcast.Cursna = {
        ammo = "Ombre Tathlum +1",
        head = "Vanya Hood",
        neck = "Incanter's Torque",
        body = "Peda. Gown +3",
        hands = "Peda. Bracers +1",
        legs = "Acad. Pants +3",
        feet = "Vanya Clogs",
    }
        
    sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

    sets.midcast['Enhancing Magic'] = {
        main = "Bolelabunga",
        sub = "Ammurapi Shield",
        ammo = "Ombre Tathlum +1",
        head = "Telchine Cap",
        neck = "Incanter's Torque",
        ear1 = "Mimir Earring",
        ear2 = 'Andoaa Earring',
        body = "Peda. Gown +3",
        hands = "Telchine Gloves",
        back = "Fi Follet Cape +1",
        legs = "Telchine Braconi",
        feet = "Telchine Pigaches",
    }

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
        main = "Bolelabunga",
        sub = "Ammurapi Shield",
        head = "Arbatel Bonnet +1",
        ear1 = "Magnetic Earring",
        ear2 = "Calamitous Earring",
        back = "Bookworm's Cape",
        waist = "Embla Sash",
    })

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
        waist = "Siegel Sash"
    })
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
        ear1 = "Magnetic Earring",
        ear2 = "Calamitous Earring",
    })
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
    })
    sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {
        ear1 = "Magnetic Earring",
        ear2 = "Calamitous Earring",
        feet = "Peda. Loafers +1",
    })
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
        ear1 = "Magnetic Earring",
        ear2 = "Calamitous Earring",
    })
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
        ear1 = "Magnetic Earring",
        ear2 = "Calamitous Earring",
    })
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

    sets.midcast['Enfeebling Magic'] = {
        main = "Daybreak",
        sub = "Ammurapi Shield",
        ammo = "Ombre Tathlum +1",
        head = empty,
        neck = "Argute Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Cohort Cloak +1",
        hands = "Acad. Bracers +3",
        ring1 = "Crepuscular Ring",
        ring2 = "Kishar Ring",
        back = gear.ambu_Nuke,
        waist = "Eschan Stone",
        legs = "Acad. Pants +3",
        feet = "Acad. Loafers +3",
    }

    gear.DarkArtsEnfeebling = set_combine(sets.midcast['Enfeebling Magic'], {
        head = "Acad. Mortar. +2",
        body = "Acad. Gown +2"
    })
        
    sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
    
    sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {}

    sets.midcast.Kaustra = {
        main = "Akademos",
        sub = "Enki Strap",
        ammo = "Ombre Tathlum +1",
        head = "Pixie Hairpin +1",
        neck = "Argute Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Merlinic Jubbah",
        hands = "Amalric Gages +1",
        ring1 = "Metamor. Ring +1",
        ring2 = "Archon Ring",
        back = gear.ambu_Nuke,
        waist = "Hachirin-no-Obi",
        legs = "Amalric Slops +1",
        feet = gear.jhakri.feet,
    }
    sets.midcast.Kaustra.Resistant = set_combine(sets.midcast.Kaustra, {})

    sets.midcast.Drain = {
        main = "Rubicundity",
        sub = "Ammurapi Shield",
        ammo = "Ombre Tathlum +1",
        head = 'Pixie Hairpin +1',
        neck = "Erra Pendant",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Acad. Gown +2",
        ring2 = "Archon Ring",
        ring1 = "Evanescence Ring",
        waist = "Fucho-no-Obi",
        legs = "Peda. Pants +2",
        feet = "Acad. Loafers +3",
    }
    sets.midcast.Drain.Resistant = set_combine(sets.midcast.Drain, {})

    sets.midcast.Aspir = sets.midcast.Drain
    sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
        head = "Acad. Mortar. +2",
        neck = "Argute Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Acad. Gown +2",
        hands = "Acad. Bracers +3",
        ring1 = "Crepuscular Ring",
        ring2 = "Kishar Ring",
        back = gear.ambu_Nuke,
        legs = "Acad. Pants +3",
        feet = "Acad. Loafers +3",
    }
    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
        main = "Akademos",
        sub = "Enki Strap",
        ammo = "Ombre Tathlum +1",
        head = "Peda. M.Board +2",
        neck = "Argute Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Merlinic Jubbah",
        hands = "Amalric Gages +1",
        ring1 = "Metamor. Ring +1",
        back = gear.ambu_Nuke,
        waist = "Hachirin-no-Obi",
        legs = "Amalric Slops +1",
        feet = "Amalric Nails +1"
    }

    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'], {
        legs = "Perdition Slops",
    })
        
    -- Custom refinements for certain nuke tiers
    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})

    sets.midcast.Helix = {
        main = "Daybreak",
        sub = "Culminus",
        ammo = "Ghastly Tathlum +1",
        head = "Peda. M.Board +2",
        neck = "Argute Stole +1",
        ear1 = "Regal Earring",
        ear2 = "Malignance Earring",
        body = "Merlinic Jubbah",
        hands = "Amalric Gages +1",
        ring1 = "Mallquis Ring",
        ring2 = "Metamor. Ring +1",
        back = gear.ambu_Nuke,
        waist = "Eschan Stone",
        legs = "Amalric Slops +1",
        feet = "Amalric Nails +1"
    }
    sets.midcast.Helix.Resistant = set_combine(sets.midcast.Helix, {})
    sets.midcast.Helix.Proc = {}

    sets.midcast.Impact = set_combine(sets.midcast['Enfeebling Magic'], {
        head = empty,
        body = "Twilight Cloak",
    })

    sets.midcast.Dispelga = set_combine(sets.midcast['Enfeebling Magic'], {
        main = "Daybreak",
    })
        
    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        main = "Malignance Pole",
        sub = "Mensch Strap",
        ammo = "Homiliary",
        head = "Acad. Mortar. +2",
        neck = "Warder's Charm +1",
        ear1 = "Etiolation Earring",
        ear2 = "Infused Earring",
        body = "Mallquis Saio +2",
        hands = "Acad. Bracers +3",
        ring1 = "Defending Ring",
        ring2 = "Warden's Ring",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }

    sets.idle.DynaRP = set_combine(sets.idle, {
        neck = "Argute Stole +1",
    })

    sets.idle.Refresh = set_combine(sets.idle, {
        main = "Daybreak",
        sub = "Genmei Shield",
        body = gear.jhakri.body,
        ear1 = "Etiolation Earring",
        legs = "Lengo Pants",
    })
        
    sets.Kiting = {}
    sets.latent_refresh = {waist="Fucho-no-obi"}
    sets.latent_refresh_grip = {}
    sets.TPEat = {}
    sets.DayIdle = {}
    sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        head = "Blistering Sallet +1",
        neck = 'Sanctity Necklace',
        ear1 = 'Mache Earring +1',
        ear2 = 'Crep. Earring',
        body = 'Peda. Gown +3',
        -- hands = "Gazu Bracelet",
        ring1 = 'Petrov Ring',
        ring2 = 'Rajas Ring',
        waist = 'Windbuffet Belt +1',
        legs = 'Nyame Flanchard',
        feet = 'Nyame Sollerets',
    }
        
    sets.engaged.PDT = set_combine(sets.engaged, {
        neck = 'Loricate Torque +1',
        ear2 = 'Odnowa Earring +1',
        ring2 = 'Defending Ring',
    })

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"} 
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"} 
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"} 
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"} 
    sets.buff['Penury'] = {} -- legs="Arbatel Pants +1"
    sets.buff['Parsimony'] = {} -- legs="Arbatel Pants +1"
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"} -- 
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"} -- 
    
    sets.HPDown = {}
        
    sets.HPCure = {}
    
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Light Arts'] = {legs="Academic's Pants +3"} --
    sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.Sublimation = {
        head = "Acad. Mortar. +2",
        body = "Peda. Gown +3",
        waist = "Embla Sash",
        ear1 = "Savant's Earring"
    }
    sets.buff.DTSublimation = {
        head = "Acad. Mortar. +2",
        body = "Peda. Gown +3",
        waist = "Embla Sash",
        ear1 = "Savant's Earring"
    }
    
    -- Weapons sets
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'BLM' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'WHM' then
        set_macro_page(1, 20)
    else
        set_macro_page(1, 20)
    end
end

function user_job_lockstyle()
	if global_lockstyle then
		windower.chat.input('/lockstyleset ' .. global_lockstyle)
	else
		windower.chat.input('/lockstyleset 4')
	end
end

buff_spell_lists = {
    Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
        {Name='Haste',		Buff='Haste',		SpellID=57,		When='Always'},
        {Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		When='Always'},
        {Name='Klimaform',	Buff='Klimaform',	SpellID=287,	When='Combat'},
    },
    
    Default = {
        {Name='Reraise III',	Buff='Reraise',		SpellID=142,	Reapply=false},
        {Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
        {Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
        {Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
        {Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
        {Name='Klimaform',	Buff='Klimaform',	SpellID=287,	Reapply=false},
        {Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
        {Name='Regen V',		Buff='Regen',		SpellID=504,	Reapply=false},
        {Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
    },
}