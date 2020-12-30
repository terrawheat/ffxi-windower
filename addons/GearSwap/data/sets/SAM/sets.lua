organizer_items = {
  vim="Vim Torque +1"
}

sets.idle = {
  head = 'Wakido Kabuto +2',
  ear1 = 'Infused Earring',
  ear2 = 'Genmei Earring',
  neck = 'Twilight Torque',
  body = 'Tartarus Platemail',
  back = 'Aptitude Mantle +1',
  legs = 'Ryuo Hakama',
  feet = 'Valorous Greaves',
  ring1 = 'Defending Ring',
  ring2 = 'Karieyh Ring',
}

sets.dt = {
  body = 'Kendatsuba Samue',
  legs = 'Kendatsuba Hakama',
  ring1 = 'Defending Ring'
}

sets.tp = {};
sets.tp.indices = {'ZanHasso', 'Max'}
sets.tp.current = 1;

sets.tp.ZanHasso = {
  sub="Nepenthe Grip +1",
  ammo="Ginsen",
  head="Flamma Zucchetto +2",
  hands="Wakido Kote +2",
  body="Kasuga Domaru +1",
  legs = 'Ryuo Hakama',
  feet="Ryuo Sune-ate +1",
  neck="Sam. Nodowa +1",
  waist="Ioskeha Belt",
  left_ear="Brutal Earring",
  right_ear="Mache Earring +1",
  left_ring="Flamma Ring",
  right_ring="Chirich ring +1",
  back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

sets.tp.Max = set_combine(sets.tp.ZanHasso, {
  body = 'Kendatsuba Samue',
  legs = 'Kendatsuba Hakama',
  feet = "Tatena. Sune. +1"
})

sets.ws = {
  ammo="Knobkierrie",
  head="Valorous Mask",
  body="Wakido Domaru +2",
  hands="Valorous Mitts",
  feet="Valorous Greaves",
  neck="Sam. Nodowa +1",
  waist="Fotia Belt",
  legs="Wakido Haidate +2",
  left_ear="Thrud Earring",
  right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  left_ring="Karieyh Ring",
  right_ring="Ifrit Ring",
  back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}},
}

sets.ws_acc = set_combine(sets.ws, {
  head = "Wakido Kabuto +2",
  feet = "Flam. Gambieras +1"
})

sets.hybrid_ws = set_combine(sets.ws, {
  neck="Fotia Gorget",
  left_ear="Friomisi Earring",
  right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  body = "Founder's breastplate",
  hands = "Founder's gauntlets",
  feet = "Founder's Greaves"
});

sets.meditate = {
  head = "Wakido Kabuto +2",
  back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

