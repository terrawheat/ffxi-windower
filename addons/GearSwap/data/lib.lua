function tellMe(str)
  windower.add_to_chat(219, str)
end

function has_any_buff_of(buff_set)
  for i,v in pairs(buff_set) do
      if buffactive[v] ~= nil then return true end
  end
end