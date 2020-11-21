sets.idle = {}

sets.dt = {}

sets.tp = {
  main={ name="Ichigohitofuri", augments={'DMG:+30','STR+20','Accuracy+15',}},
  sub="Nepenthe Grip +1",
  ammo="Ginsen",
  head="Flamma Zucchetto +2",
  hands="Wakido Kote +2",
  body="Kasuga Domaru +1",
  legs="Ryuo Hakama",
  feet="Ryuo Sune-ate",
  neck="Sam. Nodowa +1",
  waist="Ioskeha Belt",
  left_ear="Brutal Earring",
  right_ear="Mache Earring +1",
  left_ring="Flamma Ring",
  right_ring="Petrov Ring",
  back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

sets.ws = {
  ammo="Ginsen",
  head="Valorous Mask",
  body="Flamma Korazin",
  hands="Valorous Mitts",
  feet="Flamma Gambieras +1",
  neck="Sam. Nodowa +1",
  waist="Fotia Belt",
  left_ear="Ishvara Earring",
  right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
  left_ring="Karieyh Ring",
  right_ring="Rajas Ring",
  back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

sets.hybrid_ws = set_combine(sets.ws, {
  body = "Founder's breastplate",
  hands = "Founder's gauntlets",
  feet = "Founder's Greaves"
});

sets.meditate = {
  head = "Wakido Kabuto +1",
  back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

