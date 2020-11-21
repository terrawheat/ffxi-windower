sets.roll = {
  head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}},
  body="Meghanada Cuirie",
  hands="Chasseur's Gants",
  legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','Crit.hit rate+1',}},
  feet={ name="Lanun Bottes +1", augments={'Enhances "Wild Card" effect',}},
  neck="Twilight Torque",
  left_ear="Ethereal Earring",
  left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%',}},
  right_ring="Barataria Ring",
  back={ name="Camulus's Mantle", augments={'INT+20','Eva.+9 /Mag. Eva.+9',}},
}

sets.weapon = {}
sets.weapon.indices = {'Savage DW', 'Savage MH', 'Leaden DW', 'Leaden MH'}
sets.weapon.current = 1;
sets.weapon['Savage DW'] = {
  main = 'Naegling',
  sub = 'Blurred Knife',
  range = 'Anarchy +2',
}
sets.weapon['Savage MH'] = {
  main = 'Naegling',
  range = 'Anarchy +2',
}
sets.weapon['Leaden DW'] = {
  main = 'Naegling',
  sub = 'Blurred Knife',
  range = 'Doomsday',
  ammo = 'Titanium Bullet',
}
sets.weapon['Leaden MH'] = {
  main = 'Naegling',
  range = 'Doomsday',
  ammo = 'Titanium Bullet',
}

sets.idle = {
  head="Meghanada Visor +1",
  body="Meghanada Cuirie",
  hands="Meg. Gloves +1",
  legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%','Crit.hit rate+1',}},
  feet={ name="Lanun Bottes +1", augments={'Enhances "Wild Card" effect',}},
  neck="Twilight Torque",
  left_ear="Etiolation Earring",
  right_ear="Infused Earring",
  left_ring="Warden's Ring",
  right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%',}},
  back="Solemnity Cape",
}

sets.rng = {}
sets.rng.snapshot = {
  head = "Pursuer's beret",
  body = "Pursuer's doublet",
  legs={ name="Lanun Trews" },
  feet="Meg. Jam. +1",
  waist="Impulse Belt",
  back="Navarch's Mantle",
}

sets.rng.atk = {
  head = "Pursuer's beret",
  body = "Pursuer's doublet",
  hands="Meg. Gloves +1",
  legs="Meg. Chausses +1",
  feet="Meg. Jam. +1",
  neck="Ocachi Gorget",
  waist="Kwahu Kachina Belt",
  left_ear="Volley Earring",
  left_ring="Cacoethic Ring",
  right_ring="Longshot Ring",
  back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}

sets.ws = {}

sets.ws.leadenSalute = {
  ammo = 'Orichalc. Bullet',
  head="Pixie Hairpin +1",
  body={ name="Rawhide Vest", augments={'HP+50','"Subtle Blow"+7','"Triple Atk."+2',}},
  hands="Pursuer's Cuffs",
  legs="Shned. Tights +1",
  feet={ name="Lanun Bottes +1", augments={'Enhances "Wild Card" effect',}},
  neck="Sanctity Necklace",
  waist="Salire Belt",
  left_ear="Friomisi Earring",
  right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  left_ring="Arvina Ringlet +1",
  right_ring="Acumen Ring",
  back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}

sets.ws.wildfire = set_combine(sets.ws.leadenSalute, {
  right_ear="Novio Earring"
})

sets.ws.lastStand = {
  ammo = 'Titanium Bullet',
  head="Meghanada Visor +1",
  body="Meghanada Cuirie",
  hands="Meg. Gloves +1",
  legs="Meg. Chausses +1",
  feet="Meg. Jam. +1",
  neck="Fotia Gorget",
  waist="Fotia Belt",
  left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  right_ear="Ishvara Earring",
  left_ring="Hajduk Ring",
  right_ring="Cacoethic Ring",
  back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
}

sets.ws.savage = {
  head="Lilitu Headpiece",
  body={ name="Herculean Vest", augments={'Crit. hit damage +3%','DEX+2','Attack+13',}},
  hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
  legs="Meg. Chausses +1",
  feet="Meg. Jam. +1",
  neck="Lacono Neck. +1",
  waist="Prosilio Belt",
  left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  right_ear="Ishvara Earring",
  left_ring="Karieyh Ring",
  right_ring="Ifrit Ring",
  back="Buquwik Cape",
}

sets.tp = {}

sets.tp.normal = {
  head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
  body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
  hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
  legs="Samnuha Tights",
  feet={ name="Herculean Boots", augments={'Attack+17','"Triple Atk."+2','AGI+3','Accuracy+12',}},
  neck="Sanctity Necklace",
  waist="Windbuffet Belt +1",
  left_ear="Mache Earring +1",
  right_ear="Brutal Earring",
  left_ring="Rajas Ring",
  right_ring="Chirich Ring",
  back="Bleating Mantle",
}